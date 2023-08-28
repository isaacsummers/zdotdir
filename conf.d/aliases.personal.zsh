# env
alias ssource='function _ssource(){ set -a; source "$@"; set +a }; _ssource'
alias lsource='function _lsource(){ set -a; source "$@" }; _lsource'
alias senv='ssource .env'
alias ssenv='ssource .env'
alias slenv='lsource .env'

# ssh
alias sshrem='ssh-add -D'
alias sshall='find $HOME/.ssh -type f -regex ".*/id_[^.]*$" | xargs ssh-add'
alias sshdir='cd $HOME/.ssh'
alias sshconfig='code $HOME/.ssh/config'
alias sshcreate='cd $HOME/.ssh && ssh-keygen -t ed25519 -C ${HOST%%.local}'
alias sshlist='ssh-add -l'

# ls
alias l='exa -la1 --icons' #
alias ls="exa -lh --icons --no-permissions --no-user --group-directories-first"
alias ll='exa -lh --icons --group-directories-first --octal-permissions'
alias la='exa -lah --icons --group-directories-first --octal-permissions -d .*'
alias lsa='exa -lah --icons --group-directories-first --octal-permissions'
alias ldot='exa -ld --icons --group-directories-first --octal-permissions .*'
alias ppath='echo ${PATH//:/\\n}'
alias fppath='echo ${FPATH//:/\\n}'
alias ag='alias | grep'

# dir
alias take='function _take(){ mkdir -p "$@" && cd "$_"; }; _take'

# pyenv
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

# pip
alias pipunall='pip uninstall -yr <(pip freeze)'

# git
alias gmv='git mv'
alias gbnma='git branch --all --no-merged'
alias gbmm='git branch --merged main'
alias gbmd='git branch --merged develop'
alias cgig='cat .gitignore'
alias gba='git branch -a'
alias gbav='git branch --all -vv'
alias gsta='git stash'
alias gstp='git stash pop'
alias gpll='git pull'
alias gpsh='git push'
alias gfa='git fetch --all'
alias gl='git pull'
alias gp='git push'
alias gsta='git stash'
alias glsf='git ls-files'
alias glsfv='git ls-files -v'
alias glsfz='git ls-files -z'
alias gignoredir='git ls-files -z | xargs -0 git update-index --assume-unchanged'
alias gunignoredir='git ls-files -z | xargs -0 git update-index --no-assume-unchanged'

# git flow
alias gfl='git-flow'
alias gfli='git-flow init'
alias gflf='git-flow feature'
alias gflr='git-flow release'
alias gflh='git-flow hotfix'
alias gfls='git-flow support'
alias gflv='git-flow version'

# git crypt
alias gcr='git-crypt'
alias gcrl='git-crypt lock'
alias gcrul='git-crypt unlock'
alias gcrs='git-crypt status'

# github cli
alias ghrsd='gh repo set-default'

# poetry
alias ptr='poetry'
alias ptri='poetry install'
alias ptric='poetry install --compile'
alias ptris='poetry install --sync'
alias ptrisc='poetry install --sync --compile'
alias ptriswd='poetry install --sync --with dev'
alias ptriswdc='poetry install --sync --with dev --compile'
alias ptrl='poetry lock'
alias ptrln='poetry lock --no-update'
alias ptrf='poetry export --without-hashes -f requirements.txt -o requirements.txt'
alias ptra='poetry add'
alias ptrr='poetry remove'
alias ptrs='poetry show'
alias ptrst='poetry show --tree'
alias ptrso='poetry show --outdated'
alias ptrsot='poetry show -T --outdated'
alias ptru='poetry update'
alias ptruaa='poetry show -T -o | awk "{print \$1}" | xargs -tI {} poetry add {}@latest || true'
alias ptrua='poetry show -T -o | awk "{print \$1}" | xargs -tI {} poetry update {} || true'
alias ptrlf='ptrl && ptrf'
alias ptrisl='ptrln && ptris'
alias ptrislf='ptrisl && ptrf'

# zsh
alias zreload='exec zsh'
alias zrr='exec zsh'
alias arr='. $ZDOTDIR/conf.d/aliases.personal.zsh'
alias zcompdir='zcompiledir'

# misc
alias code='code-insiders'
alias code.='code -n .'
alias zdotc='open $HOME/.config/zsh/zsh.code-workspace'
alias vimrc='nvim $HOME/.vimrc'
alias zcheat='code $ZDOTDIR/.docs/zsh-cheatsheet.md'
alias zstring='code $ZDOTDIR/.docs/zsh-string.md'
alias mini='mkinit'
alias minin='mkinit --nomods --black'
alias aliasedit='code $ZDOTDIR/conf.d/aliases.personal.zsh'
alias shlev='echo $SHLVL'
# alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

noexpand_aliases+=(
    rm
    del
    safe-rm
    l
    ls
    ll
    lsa
    ldot
)