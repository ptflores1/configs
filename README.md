# Personal configurations

Portable starting point for my Neovim, Zsh/Oh My Zsh, and tmux setup.

## New machine

1. Install Git and clone this repository.
2. Install each tool (Neovim, Zsh, tmux) with the system package manager.
3. Run `./zsh/install.sh`, `./nvim/install.sh`, and `./tmux/install.sh` from the repository root as needed.
4. Follow each folder's README for plugin and external tool setup.

Installers preserve existing config files in `~/.config-backup/` before linking repository files. Keep credentials, machine-specific SDK configuration, and local-only environment files outside this repository.
