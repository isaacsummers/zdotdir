#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

#
# Editors
#

export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-vim}"
export PAGER="${PAGER:-less}"

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

export ZSH_CUSTOM=${ZSH_CUSTOM:-$ZDOTDIR}
export ANTIDOTE_HOME=$ZDOTDIR/.cache/antidote

export ZSH_THEME=$ZDOTDIR/themes/ixs.toml

export STARSHIP_CONFIG=$ZDOTDIR/themes/starship.toml

export HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/home/linuxbrew/.linuxbrew}
export PYENV_ROOT=${PYENV_ROOT:-$HOME/.pyenv}

# export ZSH_TMUX_AUTOSTART=true
# export ZSH_TMUX_AUTOSTART_ONCE=false
# export ZSH_TMUX_AUTOCONNECT=true

export NVM_DIR=${NVM_DIR:-${XDG_CONFIG_DIR:-$HOME/.config}/nvm}
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  $PYENV_ROOT/bin(N)
  $HOMEBREW_PREFIX/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
