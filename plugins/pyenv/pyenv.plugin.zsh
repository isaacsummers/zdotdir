# #!/bin/zsh

# export PYENV="$HOME/.pyenv/pyenv-win"
# export PYENV_ROOT="$HOME/.pyenv/pyenv-win"
# export PYENV_HOME="$HOME/.pyenv/pyenv-win"
# # export PYENV_VENV_HOME="$HOME/.pyenv-win-venv"
# # export PIPX_DEFAULT_PYTHON="$PYENV_ROOT/versions/3.12.4/bin/python"

# [[ -d $PYENV_ROOT/bin ]] && path=($PYENV_ROOT/bin $path)
# # [[ -d $PYENV_VENV_HOME/bin ]] && path=($PYENV_VENV_HOME/bin $path)

# if command -v pyenv 1>/dev/null 2>&1; then
#   if pyenv init - 1>/dev/null 2>&1; then
#     eval "$(pyenv init -)"
#     eval "$(pyenv virtualenv-init -)"
#   else
#     [[ -d $PYENV_ROOT/shims ]] && path=($PYENV_ROOT/shims $path)
#     # [[ -d $PYENV_ROOT/shims ]] && path=($path $PYENV_ROOT/shims)
#   fi
# fi
