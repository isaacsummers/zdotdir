#
# .zshenv - Zsh environment file, loaded always.
#

setopt extendedglob

export ZDOTDIR=~/.config/zsh

# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_RUNTIME_DIR=~/.xdg
export XDG_PROJECTS_DIR=~/Projects

# Custom
export DOTFILES=$XDG_CONFIG_HOME/dotfiles
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export REPO_HOME=$XDG_CACHE_HOME/repos
export ANTIDOTE_HOME=$REPO_HOME

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Graphviz pkgconfigpath
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export C_INCLUDE_PATH="/opt/homebrew/opt/graphviz/include"

# PNPM
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Ensure path arrays do not contain duplicates.
typeset -gU fpath path cdpath

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  # $XDG_PROJECTS_DIR/mattmc3(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(

  # pyenv
  $PYENV_ROOT/bin(N)

  # conda
  $HOME/miniconda3/bin(N)
  $HOME/opt/anaconda3/bin(N)

  # core
  $HOME/{,s}bin(N)
  $HOMEBREW_PREFIX/{,s}bin(N)
  /opt/{homebrew,local,linuxbrew}/{,s}bin(N)
  /home/linuxbrew/.linuxbrew/{,s}bin(N)
  /usr/local/{,s}bin(N)

  # emacs
  $HOME/.emacs.d/bin(N)
  $XDG_CONFIG_HOME/emacs/bin(N)

  # apps
  /{usr/local,opt/homebrew}/opt/curl/bin(N)
  /{usr/local,opt/homebrew}/opt/go/libexec/bin(N)
  /{usr/local,opt/homebrew}/share/npm/bin(N)
  /{usr/local,opt/homebrew}/opt/ruby/bin(N)
  /{usr/local,opt/homebrew}/lib/ruby/gems/*/bin(N)
  $HOME/.gem/ruby/*/bin(N)
  
  # snowsql
  /Applications/SnowSQL.app/Contents/MacOS(N)

  # pipx
  $HOME/.local/bin(N)

  # rust
  $XDG_DATA_HOME/cargo/bin(N)

  # pnpm
  $XDG_DATA_HOME/pnpm

  # privado
  $HOME/.privado/bin(N)

  # path
  $path
)

# Apps
export EDITOR=nvim
export VISUAL=code
export PAGER=less
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Regional settings
export LANG='en_US.UTF-8'

# Misc
export KEYTIMEOUT=1
export SHELL_SESSIONS_DISABLE=1 # Make Apple Terminal behave.

if ! pgrep -x "gpg-agent" > /dev/null; then
  eval $(gpgconf --launch gpg-agent)
  echo "test" | gpg --clearsign --pinentry-mode loopback > /dev/null
fi
export GPG_TTY=$(tty)

export LESSOPEN='|$ZDOTDIR/conf.d/.lessfilter %s'
export LESS="-R"
# export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_CONFIG="${TMUX_CONFIG:-$XDG_CONFIG_HOME/tmux/tmux.conf}"
# export FORGIT_GLO_FORMAT='%C(auto)%h%d %s %C(black)%C(bold)%cr%reset'

# test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
# test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$($(brew --prefix)/bin/brew shellenv)"

export VIRTUAL_ENV_DISABLE_PROMPT=1

# Use `< file` to quickly view the contents of any file.
[[ -z "$READNULLCMD" ]] || READNULLCMD=$PAGER

# vim: ft=zsh sw=2 ts=2 et

