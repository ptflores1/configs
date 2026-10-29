#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
backup_dir="$HOME/.config-backup/$(date +%Y%m%d-%H%M%S)"
mkdir -p "$backup_dir"

install_file() {
  local source_file="$1" target="$2"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mkdir -p "$backup_dir"
    cp -p "$target" "$backup_dir/$(basename "$target")"
    printf 'Backed up %s to %s\n' "$target" "$backup_dir"
  fi
  ln -sfn "$source_file" "$target"
}

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

install_file "$repo_dir/zsh/.zshrc" "$HOME/.zshrc"
install_file "$repo_dir/zsh/.zprofile" "$HOME/.zprofile"
install_file "$repo_dir/zsh/.zshenv" "$HOME/.zshenv"
install_file "$repo_dir/zsh/p10k.zsh" "$HOME/.p10k.zsh"

custom="$HOME/.oh-my-zsh/custom"
mkdir -p "$custom/plugins"
[[ -d "$custom/plugins/zsh-autosuggestions" ]] || git clone https://github.com/zsh-users/zsh-autosuggestions "$custom/plugins/zsh-autosuggestions"
[[ -d "$custom/plugins/zsh-syntax-highlighting" ]] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$custom/plugins/zsh-syntax-highlighting"

printf 'Zsh configuration installed. Start a new shell or run: exec zsh\n'
