# Zsh and Oh My Zsh

Contains portable Zsh startup files, the personalized Powerlevel10k prompt, and an installer for Oh My Zsh plus the two custom plugins used here. It does not copy the Oh My Zsh or plugin source trees into this repository.

## Setup

Install Git, Zsh, and a Nerd Font for the Powerlevel10k glyphs. Clone this repository, then run:

```sh
./zsh/install.sh
```

The installer links the startup files into `$HOME` and backs up existing regular files to `~/.config-backup/`. Review `.zshrc` and add machine-specific SDK paths or secrets locally; those are intentionally not part of this portable setup.
