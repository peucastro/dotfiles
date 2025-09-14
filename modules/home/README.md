# Home Modules

This folder contains a modular Home Manager configuration for user environments. Modules are organized by functionality:

- `base/` - Shells, git, and essential CLI tools
- `cli/` - Commmand-line interface applications and utilities.
- `gui/` - Graphical applications, desktop environments, and GUI packages
- `tui/` - Terminal user interface programs, editors, and utilities

Each subfolder contains a `default.nix` that imports all modules in that folder.
