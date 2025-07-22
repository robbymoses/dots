# Source .zprofile if it hasn't been sourced yet
  if [[ -z "$ZPROFILE_SOURCED" ]]; then
    export ZDOTDIR="$HOME/.config/zsh"
    source $ZDOTDIR/.zprofile
    export ZPROFILE_SOURCED=1
  fi
### OPTS
  setopt extended_glob     # Use Advanced Globbing Patterns
  setopt globdots
  setopt vi
  setopt HIST_IGNORE_SPACE # Don't save when prefixed with space
  setopt HIST_IGNORE_DUPS  # Don't save duplicate lines
  setopt appendhistory
  setopt SHARE_HISTORY     # Share history between sessions
  unsetopt PROMPT_SP

### PATH
  typeset -U path

  path=("${(s/:/)PATH}")

  path+=(
  "$HOME/.npm_modules/bin"
  )

  export PATH="${(j.:.)path}"
  #path=(
  #  "$HOME/.npm_modules/bin"
  #)
  # Remove any duplicates and non-existent entries
  #typeset -U path
  #path=($^path(N-/))

  #export PATH="${(j.:.)path}"

### HISTORY
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTSIZE=50000
SAVEHIST=50000

# Load completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

### Evals
# eval "$(direnv hook zsh)"

### Plugins
# Set the directory we want to store zinit and plugins
  ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"

# Download Zinit, if it's not there yet
  if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
  fi

# Source/Load zinit
  source "${ZINIT_HOME}/zinit.zsh"

  zinit light zsh-users/zsh-syntax-highlighting
