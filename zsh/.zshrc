# Oh My Zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source "$ZSH/oh-my-zsh.sh"

# Load the personal Powerlevel10k prompt when present.
[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

# User binaries
export PATH="$HOME/.local/bin:$PATH"

# Optional tools: initialize only when installed.
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init --path)"
command -v wt >/dev/null 2>&1 && eval "$(wt config shell init zsh)"

# pnpm (installed by its standalone installer)
export PNPM_HOME="${PNPM_HOME:-$HOME/Library/pnpm}"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Personal aliases
alias claude-work='CLAUDE_CONFIG_DIR="$HOME/.claude-work" claude'
alias claude-personal='CLAUDE_CONFIG_DIR="$HOME/.claude-personal" claude'
