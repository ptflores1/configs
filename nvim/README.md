# Neovim

This is the configuration from `~/.config/nvim`, including the `lazy.nvim` lockfile.

## Setup

Install Neovim and a C compiler, then put this directory at `~/.config/nvim` (or symlink it):

```sh
ln -s "$PWD/nvim" "$HOME/.config/nvim"
```

Open Neovim and run `:Lazy sync` to install the locked plugins. Some configured language servers, formatters, and tools also need to be installed separately; see the plugin specifications under `lua/ptflores1/lazy/`.
