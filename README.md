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

## Color Palette

| Token | Hex |
| ------- | ----- |
| `active_border` | `#ffffff` |
| `inactive_border` / `border` | `#444444` |
| `bg-dark` | `#141414` |
| `bg` | `#1e1e1e` |
| `bg-alt` | `#252525` |
| `bg-selected` | `#333333` |
| `fg` | `#c8c8c8` |
| `fg-selected` | `#ffffff` |
| `fg-dim` | `#888888` |
| `urgent` | `#900000` |
| `warning` | `#d08770` |
| `critical` | `#bf616a` |

## License

MIT - check [LICENSE](LICENSE)
