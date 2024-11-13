#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Zsh options.
setopt extended_glob

# Autoload functions.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Source zstyles.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# # Set prompt theme
# typeset -ga ZSH_THEME
# zstyle -a ':zephyr:plugin:prompt' theme ZSH_THEME ||
# ZSH_THEME=(starship ixs)

# # Set helpers for antidote.
# is-theme-p10k()     { [[ "$ZSH_THEME" == (p10k|powerlevel10k)* ]] }
# is-theme-starship() { [[ "$ZSH_THEME" == starship* ]] }

# # Aliases
# [[ -r ${ZDOTDIR:-$HOME}/.zaliases ]] && source ${ZDOTDIR:-$HOME}/.zaliases

# # Prompt
# setopt prompt_subst transient_rprompt
# autoload -Uz promptinit && promptinit
# prompt "$ZSH_THEME[@]"

# Clone antidote if necessary.
[[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Zsh config.
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
