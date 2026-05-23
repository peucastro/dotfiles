#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

log() {
	echo -e "\n\033[1;34m=== $1 ===\033[0m"
}

for cmd in stow git curl; do
	if ! command -v "$cmd" &>/dev/null; then
		echo "Error: $cmd is not installed."
		exit 1
	fi
done

log "Enabling multilib repository"
if grep -q '^#\[multilib\]' /etc/pacman.conf; then
	sudo sed -i '/^#\[multilib\]/{s/^#//;n;s/^#//}' /etc/pacman.conf
else
	echo "multilib is already enabled. Skipping."
fi
sudo pacman -Sy

log "Installing packages"
if [ -f pacman.txt ]; then
	sudo pacman -S --needed - <pacman.txt
else
	echo "Warning: pacman.txt not found. Skipping."
fi

log "Setting up yay"
if ! command -v yay &>/dev/null; then
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si
	cd "$SCRIPT_DIR"
	rm -rf /tmp/yay
else
	echo "yay is already installed."
fi

log "Stowing dotfiles"
rm -f "$HOME/.bashrc"
stow -t "$HOME" */

log "Configuring GTK"
if command -v gsettings &>/dev/null; then
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark 2>/dev/null || true
	gsettings set org.gnome.desktop.interface font-name 'Adwaita Sans 12' 2>/dev/null || true
fi

log "Setting up shell"
if [ "${SHELL}" != "/usr/bin/zsh" ]; then
	sudo chsh -s "$(command -v zsh)" "$USER"
else
	echo "Zsh is already your default shell."
fi

log "Setting up tmux TPM"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "TPM already installed. Pulling latest updates..."
	git -C ~/.tmux/plugins/tpm pull
fi

log "Setting up Docker"
sudo systemctl enable --now docker.socket
if ! id -nG "$USER" | grep -q docker; then
	sudo usermod -aG docker "$USER"
	echo "Added $USER to the docker group. (Will require relog/reboot)"
fi

log "Setting up Nix"
if ! command -v nix &>/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
else
	echo "Nix is already installed."
fi

log "Setting up Display Manager"
if ! sudo systemctl is-enabled --quiet ly@tty2 2>/dev/null; then
	sudo systemctl disable getty@tty2 2>/dev/null || true
	sudo systemctl enable ly@tty2
else
	echo "Ly display manager is already enabled."
fi

log "Enabling user services"
systemctl --user daemon-reload
systemctl --user enable --now mako
systemctl --user enable --now swayidle
systemctl --user enable --now wlsunset
sudo systemctl enable --now tailscaled.service

log "Configuring strongSwan and L2TP VPN"
sudo sed -i 's/load = yes/load = no/' /etc/strongswan.d/charon/unity.conf 2>/dev/null || true
sudo sed -i 's/^#\s*cisco_unity = no/cisco_unity = no/' /etc/strongswan.d/charon.conf 2>/dev/null || true

log "Creating user directories"
if command -v xdg-user-dirs-update &>/dev/null; then
	xdg-user-dirs-update
fi

log "Refreshing font cache"
fc-cache -f

echo -e "\n\033[1;32mDone! Reboot is highly recommended to apply all changes.\033[0m"
