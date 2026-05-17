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

log "Installing packages..."
if [ -f packages.txt ]; then
	sudo pacman -S --needed --noconfirm <packages.txt
else
	echo "Warning: packages.txt not found. Skipping."
fi

log "Stowing dotfiles..."
stow -t "$HOME" */

log "Setting up shell..."
if [ "${SHELL}" != "/usr/bin/zsh" ]; then
	sudo chsh -s "$(command -v zsh)" "$USER"
else
	echo "Zsh is already your default shell."
fi

log "Setting up tmux TPM..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "TPM already installed. Pulling latest updates..."
	git -C ~/.tmux/plugins/tpm pull
fi

log "Setting up Docker..."
sudo systemctl enable --now docker.socket
if ! id -nG "$USER" | grep -q docker; then
	sudo usermod -aG docker "$USER"
	echo "Added $USER to the docker group. (Will require relog/reboot)"
fi

log "Setting up Nix..."
if ! command -v nix &>/dev/null; then
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
else
	echo "Nix is already installed."
fi

log "Setting up Display Manager..."
if ! sudo systemctl is-enabled --quiet ly.service 2>/dev/null; then
	sudo systemctl enable ly.service
else
	echo "Ly display manager is already enabled."
fi

log "Enabling user services..."
systemctl --user enable --now mako

log "Creating user directories..."
if command -v xdg-user-dirs-update &>/dev/null; then
	xdg-user-dirs-update
fi

log "Refreshing font cache..."
fc-cache -f

echo -e "\n\033[1;32mDone! Reboot is highly recommended to apply all changes.\033[0m"
