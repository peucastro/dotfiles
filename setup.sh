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

install_nerd_font() {
	local font="$1"
	local dest="$HOME/.local/share/fonts"
	local tmp
	tmp="$(mktemp -d)"
	curl -fsSL -o "$tmp/$font.zip" \
		"https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.zip" || {
		echo "Warning: failed to download $font nerd font."
		rm -rf "$tmp"
		return 1
	}
	unzip -qo "$tmp/$font.zip" -d "$tmp"
	mkdir -p "$dest"
	cp "$tmp"/*.ttf "$dest" 2>/dev/null || true
	rm -rf "$tmp"
}

log "Installing dnf plugins"
sudo dnf install -y dnf-plugins-core

log "Enabling RPM Fusion repositories"
if ! rpm -q rpmfusion-free-release &>/dev/null; then
	FEDORA_VERSION="$(rpm -E %fedora)"
	sudo dnf install -y --nogpgcheck \
		"https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$FEDORA_VERSION.noarch.rpm" \
		"https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$FEDORA_VERSION.noarch.rpm"
else
	echo "RPM Fusion is already enabled."
fi

log "Enabling Hyprland COPR"
sudo dnf copr enable -y lionheartp/Hyprland

log "Enabling VS Code repository"
if ! rpm -q code &>/dev/null; then
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
else
	echo "VS Code is already installed."
fi

log "Upgrading system"
sudo dnf upgrade --refresh -y

log "Installing packages"
if [ -f .packages/dnf.txt ]; then
	packages=()
	while read -r pkg; do
		case "$pkg" in ""|\#*) continue ;; esac
		packages+=("$pkg")
	done < .packages/dnf.txt
	sudo dnf install -y "${packages[@]}"
else
	echo "Warning: .packages/dnf.txt not found. Skipping."
fi

log "Installing Development Tools"
sudo dnf group install -y "Development Tools" || echo "Warning: failed to install Development Tools group"

log "Setting up Flatpak"
if command -v flatpak &>/dev/null; then
	sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
	if [ -f .packages/flatpak.txt ]; then
		apps=()
		while read -r app; do
			case "$app" in ""|\#*) continue ;; esac
			apps+=("$app")
		done < .packages/flatpak.txt
		sudo flatpak install -y --noninteractive flathub "${apps[@]}"
	else
		echo "Warning: .packages/flatpak.txt not found. Skipping."
	fi
else
	echo "flatpak is not installed. Skipping flatpak apps."
fi

install_github_rpm() {
	local repo="$1"
	local binary="$2"
	local pattern="$3"

	if command -v "$binary" &>/dev/null; then
		echo "$binary is already installed."
		return 0
	fi

	local url
	url="$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest" \
		| grep -oE "\"browser_download_url\": \"[^\"]*${pattern}" \
		| sed -E 's/.*"browser_download_url": "//' \
		| head -1)" || {
		echo "Warning: could not resolve the latest rpm for $repo."
		return 1
	}

	if [ -z "$url" ]; then
		echo "Warning: no matching rpm found for $repo."
		return 1
	fi

	sudo dnf install -y "$url"
}

log "Installing Vesktop"
if command -v vesktop &>/dev/null; then
	echo "Vesktop is already installed."
else
	sudo dnf install -y https://vencord.dev/download/vesktop/amd64/rpm
fi

log "Installing Heroic Games Launcher"
install_github_rpm "Heroic-Games-Launcher/HeroicGamesLauncher" "heroic" 'x86_64\.rpm' || true

log "Installing zed"
command -v zed &>/dev/null || curl -fsSL https://zed.dev/install.sh | sh

log "Installing opencode"
command -v opencode &>/dev/null || curl -fsSL https://opencode.ai/install | bash

log "Installing Nerd Fonts"
install_nerd_font "FiraCode" || true
install_nerd_font "JetBrainsMono" || true

log "Stowing dotfiles"
[ -f "$HOME/.bashrc" ] && mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
[ -f "$HOME/.zshrc" ] && rm "$HOME/.zshrc"
[ -d "$HOME/.config" ] && mv "$HOME/.config" "$HOME/.config.bak.$(date +%s)"
stow */

log "Configuring GTK"
if command -v gsettings &>/dev/null; then
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark 2>/dev/null || true
	gsettings set org.gnome.desktop.interface font-name 'Adwaita Sans 12' 2>/dev/null || true
fi

log "Setting up shell"
FISH_PATH="/usr/bin/fish"
if ! grep -q "$FISH_PATH" /etc/shells 2>/dev/null; then
	echo "$FISH_PATH" | sudo tee -a /etc/shells >/dev/null
fi
if [ "${SHELL}" != "$FISH_PATH" ]; then
	sudo chsh -s "$FISH_PATH" "$USER"
else
	echo "Fish is already your default shell."
fi

log "Setting up tmux TPM"
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "TPM already installed. Pulling latest updates..."
	git -C ~/.tmux/plugins/tpm pull
fi

log "Setting up Docker"
if ! sudo systemctl enable --now docker.socket &>/dev/null; then
	sudo systemctl enable --now docker.service
fi
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
	if systemctl cat ly@tty2 &>/dev/null; then
		sudo systemctl enable ly@tty2
	elif systemctl cat ly.service &>/dev/null; then
		sudo systemctl enable ly.service
	else
		echo "Warning: could not find ly systemd unit. Enable it manually."
	fi
else
	echo "Ly display manager is already enabled."
fi

log "Enabling user services"
systemctl --user daemon-reload
for svc in hyprpolkitagent mako hyprpaper; do
	systemctl --user enable --now "$svc" 2>/dev/null || echo "Warning: failed to enable $svc"
done
sudo systemctl enable --now tailscaled.service

log "Creating user directories"
if command -v xdg-user-dirs-update &>/dev/null; then
	xdg-user-dirs-update
fi
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Pictures/Wallpapers

log "Refreshing font cache"
fc-cache -f

log "Removing unused dependencies"
sudo dnf autoremove -y

log "Cleaning package cache"
sudo dnf clean all

read -rp $'\nReboot now? [y/N] ' reboot_now
[[ "$reboot_now" =~ ^[Yy]$ ]] && sudo reboot
