# dotfiles

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=fff)
![macOS](https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=fff)

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/), shared between Linux and macOS.

## Software

### Cross-platform

- **Terminal**: [Alacritty](https://alacritty.org/)
- **Shell**: [Fish](https://fishshell.com/)
- **Terminal multiplexer**: [Tmux](https://github.com/tmux/tmux)
- **Editor**: [Neovim](https://neovim.io/), [VS Code](https://code.visualstudio.com/), [Zed](https://zed.dev/)

### Arch Linux only

- **Desktop environment**: [GNOME](https://www.gnome.org/)
- **Display manager**: [GDM](https://wiki.gnome.org/Projects/GDM)
- **File manager**: [Nautilus](https://apps.gnome.org/Nautilus/)
- **System monitor**: [btop](https://github.com/aristocratos/btop)

## Setup

- **Arch Linux** (fresh install):

  ```sh
  ./setup_linux
  ```

- **macOS**:

  ```sh
  xcode-select --install
  ./setup_mac
  ```

Each script stows only the modules listed in [`.modules-linux`](.modules-linux) / [`.modules-mac`](.modules-mac), installs packages (pacman/AUR or Homebrew) and applies the OS-specific config.

## License

MIT - check [LICENSE](LICENSE)
