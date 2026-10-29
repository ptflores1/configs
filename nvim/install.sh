#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target="$HOME/.config/nvim"
mkdir -p "$HOME/.config"
if [[ -e "$target" && ! -L "$target" ]]; then
  backup="$HOME/.config/nvim.backup.$(date +%Y%m%d-%H%M%S)"
  mv "$target" "$backup"
  printf 'Moved existing config to %s\n' "$backup"
fi
ln -sfn "$repo_dir/nvim" "$target"
printf 'Neovim config installed. Open nvim and run :Lazy sync.\n'
