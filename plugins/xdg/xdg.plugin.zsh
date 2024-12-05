#
# xdg - don't pollute home
#

# XDG basedirs

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_RUNTIME_DIR=~/.xdg
export XDG_PROJECTS_DIR=~/Projects

for _xdgdir in XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_RUNTIME_DIR; do
  [[ -e ${(P)_xdgdir} ]] || mkdir -p ${(P)_xdgdir}
done
unset _xdgdir

# export UV_CONFIG_FILE="$XDG_CONFIG_HOME/uv/uv.toml"
export POETRY_HOME=${POETRY_HOME:-$XDG_DATA_HOME/pypoetry}
export POETRY_CONFIG_DIR=${POETRY_CONFIG_DIR:-$XDG_CONFIG_HOME/pypoetry}
export POETRY_DATA_DIR=${POETRY_DATA_DIR:-$XDG_DATA_HOME/pypoetry}
export POETRY_CACHE_DIR=${POETRY_CACHE_DIR:-$XDG_CACHE_HOME/pypoetry}

