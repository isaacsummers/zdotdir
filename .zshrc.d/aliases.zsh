#!/bin/zsh
#
# .aliases - Set whatever shell aliases you want.
#

# single character aliases - be sparing!
# alias _=sudo
alias l=ls
alias g=git

# mask built-ins with better defaults
alias vim=nvim
alias vi=nvim
alias codei=code-insiders

# more ways to ls
# alias ll='ls -lh'
# alias la='ls -lAh'
alias ldot='ls -ld .*'

# fix common typos
alias quit='exit'
alias cd..='cd ..'

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# url encode/decode
alias urldecode='python3 -c "import sys, urllib.parse as ul; \
    print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; \
    print (ul.quote_plus(sys.argv[1]))"'

# misc
alias please=sudo
alias zshrc='${EDITOR:-vim} "${ZDOTDIR:-$HOME}"/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'

# PERSONAL ALIASES

# Shell commands
alias zrr='exec zsh -l'
alias takeover="tmux detach -a"
alias ssenv='set -a; source .env; set +a'
alias shlev='echo 1'
alias ppath='echo $PATH | tr : "\n"'

# Pyenv commands
alias pye='pyenv'
alias pyl='pyenv local'
alias pylu='pyenv local --unset'
alias pyg='pyenv global'
alias pygu='pyenv global --unset'
alias pys='pyenv shell'
alias pysu='pyenv shell --unset'
alias pyv='pyenv virtualenv'
alias pyvs='pyenv virtualenvs'
alias pyvd='pyenv virtualenv-delete'
alias pyvi='pyenv virtualenv-init'
alias pyvp='pyenv virtualenv-prefix'
alias wpyy='pyenv which python3'

# Pip commands
alias pipup='python -m pip install -U pip'

# DBT commands
alias dbtl='dbt ls'
alias dbtls='dbt ls -s'
alias dbtlss='dbt ls --selector'
alias dbtr='dbt run'
alias dbtrs='dbt run -s'
alias dbtrss='dbt run --selector'
alias dbtrf='dbt run --full-refresh'
alias dbtrfs='dbt run --full-refresh -s'
alias dbtrfss='dbt run --full-refresh --selector'
alias dbtb='dbt build'
alias dbtbs='dbt build -s'
alias dbtbss='dbt build --selector'
alias dbtbf='dbt build --full-refresh'
alias dbtbfs='dbt build --full-refresh -s'
alias dbtbfss='dbt build --full-refresh --selector'
alias dbtc='dbt compile'
alias dbtcs='dbt compile -s'
alias dbtcss='dbt compile --selector'

# Poetry commands
alias ptr='poetry'
alias ptra='poetry add'

# Miscellaneous
alias ag='alias | grep'
alias cls='clear'
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias areload='source ${ZDOTDIR:-$HOME}/.zshrc.d/aliases.zsh'

# Added
