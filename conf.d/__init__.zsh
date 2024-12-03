#
# __init__: This runs prior to any other conf.d contents.
#

# Apps
export EDITOR=nvim
export VISUAL=code
export PAGER=less

# CUSTOM
# homebrew
# test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
# test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$($(brew --prefix)/bin/brew shellenv)"

# # fzf
# source <(fzf --zsh)

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  $XDG_PROJECTS_DIR/isaacsummers(N/)
  $cdpath
)

prepath=(
  # $HOME/.version-fox/shims(N)
  $prepath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $prepath
  $path

)
