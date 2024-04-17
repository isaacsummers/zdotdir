#
# .zshrc - Run on interactive Zsh session.
#

# init profiling
[[ -z "$ZPROFRC" ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# zstyles
[[ -r $ZDOTDIR/.zstyles ]] && . $ZDOTDIR/.zstyles

# zsh custom
ZSH_CUSTOM=${ZDOTDIR:-$HOME/.config/zsh}

# use antidote for plugin management
# export ANTIDOTE_HOME=${XDG_CACHE_HOME:=~/.cache}/repos
[[ -d $ANTIDOTE_HOME/mattmc3/antidote ]] ||
  git clone --depth 1 --quiet https://github.com/mattmc3/antidote $ANTIDOTE_HOME/mattmc3/antidote

# keep all 3 for different test scenarios
# . $ANTIDOTE_HOME/mattmc3/antidote/antidote.zsh
# . ~/Projects/mattmc3/antidote/antidote.zsh
# . ${HOMEBREW_PREFIX:=/opt/homebrew}/opt/antidote/share/antidote/antidote.zsh
source $ANTIDOTE_HOME/mattmc3/antidote/antidote.zsh
antidote load

# prompt
prompt starship mmc
#prompt p10k pure

# Set the location for the compdump file
ZSH_COMPDUMP=${ZSH_COMPDUMP:-${ZDOTDIR:-~}/.zcompdump}

# Cache .zcompdump for about a day
if [[ $ZSH_COMPDUMP(#qNmh-21) ]]; then
  compinit -C -i -d "$ZSH_COMPDUMP"
else
  compinit -i -d "$ZSH_COMPDUMP"; touch "$ZSH_COMPDUMP"
fi

# Asynchronously compile .zcompdump for performance improvement
{
  if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
    zcompile "$ZSH_COMPDUMP"
  fi
} &!


# vim: ft=zsh sw=2 ts=2 et
# # >>> conda initialize >>>
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi
# # <<< conda initialize <<<


if ! pgrep -x "gpg-agent" > /dev/null; then
  eval $(gpgconf --launch gpg-agent)
  if ! gpg --list-keys > /dev/null; then
    echo "Login to gpg-agent..."
    gpglogin
  fi
fi
export GPG_TTY=$TTY

eval $(thefuck --alias)

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# done profiling
[[ -z "$ZPROFRC" ]] || zprof

# cleanup
unset ZPROFRC zplugins
true


zstyle -d ':completion:*' format
zstyle ':completion:*:descriptions' format '[%d]'

noexpand_aliases+=(
    rm
    del
    safe-rm
    l
    ls
    ll
    la
    lsa
    ldot
    cat
    brew
    z
    take
    tmux
    arr
)

# # tabtab source for pnpm package
# # uninstall by removing these lines
# [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true


source ./.evals.zsh