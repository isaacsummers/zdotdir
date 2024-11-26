#
# __init__: This runs prior to any other conf.d contents.
#

# Apps
export EDITOR=nvim
export VISUAL=code
export PAGER=less

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $prepath
  $path

  # emacs
  $HOME/.emacs.d/bin(N)
  $XDG_CONFIG_HOME/emacs/bin(N)

  # keg only brew apps
)
