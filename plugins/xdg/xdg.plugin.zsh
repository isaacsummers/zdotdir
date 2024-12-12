#
# xdg - don't pollute home
#

# XDG basedirs

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_RUNTIME_DIR=~/.xdg
export XDG_PROJECTS_DIR=~/projects

for _xdgdir in XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_RUNTIME_DIR; do
  [[ -e ${(P)_xdgdir} ]] || mkdir -p ${(P)_xdgdir}
done
unset _xdgdir

#
# Shell utils
#

# less
export LESSKEY="${LESSKEY:-$XDG_CONFIG_HOME/less/lesskey}"
export LESSHISTFILE="${LESSHISTFILE:-$XDG_CACHE_HOME/less/history}"

# readline
export INPUTRC="${INPUTRC:-$XDG_CONFIG_HOME/readline/inputrc}"

# screen
export SCREENRC="${SCREENRC:-$XDG_CONFIG_HOME/screen/screenrc}"

# tmux
export TMUX_CONFIG="${TMUX_CONFIG:-$XDG_CONFIG_HOME/tmux/tmux.conf}"
alias tmux="${aliases[tmux]:-tmux} -f \"\$TMUX_CONFIG\""

# wget
export WGETRC="${WGETRC:-$XDG_CONFIG_HOME/wget/wgetrc}"
alias wget="${aliases[wget]:-wget} --hsts-file=\$XDG_CACHE_HOME/wget/wget-hsts"

#
# Dev tools
#

# export UV_CONFIG_FILE="$XDG_CONFIG_HOME/uv/uv.toml"
export POETRY_HOME=${POETRY_HOME:-$XDG_DATA_HOME/pypoetry}
export POETRY_CONFIG_DIR=${POETRY_CONFIG_DIR:-$XDG_CONFIG_HOME/pypoetry}
export POETRY_DATA_DIR=${POETRY_DATA_DIR:-$XDG_DATA_HOME/pypoetry}
export POETRY_CACHE_DIR=${POETRY_CACHE_DIR:-$XDG_CACHE_HOME/pypoetry}

# export UV_DEFAULT_INDEX=

export MAGIC_ENTER_GIT_COMMAND="git status -sb ."

export MISE_PYTHON_UV_VENV_AUTO=true

export ZSH_CACHE_DIR=${ZSH_CACHE_DIR:-${XDG_DATA_HOME:-~/.cache}/zsh}
