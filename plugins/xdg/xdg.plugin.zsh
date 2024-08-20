#
# xdg - don't pollute home
#
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

#
# Shell utils
#

# less
export LESSKEY="${LESSKEY:-$XDG_CONFIG_HOME/less/lesskey}"
export LESSHISTFILE="${LESSHISTFILE:-$XDG_CACHE_HOME/less/history}"

#
# Dev tools
#

# gpg
export GNUPGHOME="${GNUPGHOME:-$XDG_DATA_HOME/gnupg}"
alias gpg="${aliases[gpg]:-gpg} --homedir \"\$GNUPGHOME\""

# [aws-cli]:
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

# [azure-cli]:
export AZURE_CONFIG_DIR="$XDG_DATA_HOME"/azure

# [cuda]:
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# [docker]:
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker