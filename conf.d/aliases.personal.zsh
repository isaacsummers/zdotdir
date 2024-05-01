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

# gpg
alias gpgl='gpg -k --keyid-format SHORT'
alias gpgls='gpg -K --keyid-format SHORT'
alias gpge='gpg --edit-key'

# ls
alias ls='eza --git -hl --icons --group-directories-first --no-permissions --octal-permissions --color=always --no-filesize --no-user --no-time'
alias lsa='ls -a'
alias l='eza --git -hl --icons --group-directories-first --octal-permissions' #
alias la='l -a'
alias ldot='lsa -d .*'
alias ppath='echo ${PATH//:/\\n}'
alias fppath='echo ${FPATH//:/\\n}'
alias ag='alias | grep'

# dir
alias take='function _take(){ mkdir -p "$@" && cd "$_"; }; _take'

# python
alias py='python3'
alias python='python3'

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
alias gmc='git merge --continue'
alias gbnma='git branch --all --no-merged'
alias gbmm='git branch --merged main'
alias gbmd='git branch --merged develop'
alias cgig='cat .gitignore'
alias gba='git branch -a'
alias gbav='git branch --all -vv'
alias gsta='git stash'
alias gstau='git stash --include-untracked'
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
alias gt='git tag'
# alias git_current_branch="git-current-branch"

# git flow
alias gfl='git-flow'
alias gfli='git-flow init'
alias gflf='git-flow feature'
alias gflfs='git-flow feature start'
alias gflff='git-flow feature finish'
alias gflr='git-flow release'
alias gflrs='git-flow release start'
alias gflrf='git-flow release finish -s'
alias gflh='git-flow hotfix'
alias gflhs='git-flow hotfix start'
alias gflhf='git-flow hotfix finish -s'
alias gfls='git-flow support'
alias gflss='git-flow support start'
alias gflsf='git-flow support finish'
alias gflv='git-flow version'

# git-fzf
alias gfw='git-fzf worktree'
alias gfs='git-fzf status'
alias gfb='git-fzf branch'
alias gfst='git-fzf stash'
alias gfup='git-fzf upgrade'
alias gfc='git-fzf checkout'

# git crypt
alias gcr='git-crypt'
alias gcrl='git-crypt lock'
alias gcrul='git-crypt unlock'
alias gcrs='git-crypt status'

# github cli
alias ghrsd='gh repo set-default'
alias ghrc='gh release create --generate-notes'

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
alias zreload='exec zsh -l'
alias zrr='exec zsh -l'
alias arr='. $ZDOTDIR/conf.d/aliases.personal.zsh'
alias zcompdir='zcompiledir'
alias zcheat='code $ZDOTDIR/.docs/zsh-cheatsheet.md'
alias zstring='code $ZDOTDIR/.docs/zsh-string.md'
alias shlev='echo $SHLVL'
alias zdotc='open $HOME/.config/zsh/zsh.code-workspace'
alias aliasedit='$EDITOR $ZDOTDIR/conf.d/aliases.personal.zsh'
alias plugedit='$EDITOR $ZDOTDIR/.zplugins'

# navi
alias h='navi'
alias hq='navi --query'
alias hc='navi --cheatsh'
alias ht='navi --tldr'
alias hh='navi fn welcome'

# misc
if [[ $OSTYPE == darwin* ]]; then
alias code='$VISUAL'

# elif [[ $OSTYPE == linux* ]]; then
# alias code=''
fi

# forgit
forgit_log=glo
forgit_diff=gd
forgit_add=ga
forgit_reset_head=grh
forgit_ignore=gi
forgit_checkout_file=gcf
forgit_checkout_branch=gco
forgit_branch_delete=gbd
forgit_checkout_tag=gct
forgit_checkout_commit=gcc
forgit_revert_commit=grc
forgit_clean=gclean
forgit_stash_show=gss
forgit_stash_push=gsp
forgit_cherry_pick=gcp
forgit_rebase=grb
forgit_blame=gbl
forgit_fixup=gfu

alias code='$VISUAL'
alias code.='$VISUAL -n .'
alias coden='$VISUAL -n'

alias vimrc='nvim $HOME/.vimrc'
# alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
alias vi='nvim'
alias vim='nvim'
alias fzfe='enable-fzf-tab'
alias ngtunnel='ngrok http --domain=drake-model-bonefish.ngrok-free.app 80'
alias ngtcp='ngrok tpc 22'
alias ng='ngrok'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias pipreq='pip freeze >| requirements.txt'
alias wslver='lsb_release -a'
alias gpgclear='echo "init" | gpg --clearsign'
alias gpgkill="gpgconf --kill gpg-agent"
alias gpgt='gpg-tui'

alias dvault='dotenv-vault'
alias pytest='python -m unittest'

alias pfpath='print -l $fpath'
alias ckct='cookiecutter'
alias aptup='apt update && apt upgrade'
alias saptup='sudo apt update && sudo apt upgrade'
alias dbtsr='dbt seed && dbt run'
alias dbtsrf='dbt seed && dbt run -f'
alias dbtr='dbt run'
alias dbtrs='dbt run -s'
alias dbtrf='dbt run -f'
alias dbtrfs='dbt run -fs'
alias dbtc='dbt compile'
alias ppip='pipenv'
alias ppipf='pipenv requirements >| requirements.txt'
alias pipenvf='pipenv requirements >| requirements.txt'
