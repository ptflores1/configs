# Homebrew (works with the default Apple Silicon and Intel locations)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# nvm, when installed through Homebrew
if [[ -n "${HOMEBREW_PREFIX:-}" && -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]]; then
  export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
  source "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
  [[ ! -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]] || source "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi
