#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
backup_dir="$HOME/.config-backup/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$HOME/.config/tmux" "$HOME/.config/tmux-sessionizer"

install_file() {
  local source_file="$1" target="$2"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mkdir -p "$backup_dir"
    cp -p "$target" "$backup_dir/$(basename "$target")"
    printf 'Backed up %s to %s\n' "$target" "$backup_dir"
  fi
  ln -sfn "$source_file" "$target"
}

install_file "$repo_dir/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
install_file "$repo_dir/tmux/tmux-sessionizer.conf" "$HOME/.config/tmux-sessionizer.conf"

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

printf 'Tmux config installed. Start tmux and press prefix + I to install plugins.\n'
