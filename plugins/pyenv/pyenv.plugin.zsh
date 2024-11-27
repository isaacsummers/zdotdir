#!/bin/zsh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && path=($PYENV_ROOT/bin $path)

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
