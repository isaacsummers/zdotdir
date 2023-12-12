#
# .zshrc - Run on interactive Zsh session.
#

# init profiling
[[ -z "$ZPROFRC" ]] || zmodload zsh/zprof
alias zprofrc="ZPROFRC=1 zsh"

# completions
autoload -Uz compinit bashcompinit

ZSH_COMPDUMP=${ZSH_COMPDUMP:-${ZDOTDIR:-~}/.zcompdump}

# cache .zcompdump for about a day
if [[ $ZSH_COMPDUMP(#qNmh-20) ]]; then
  compinit -C -d "$ZSH_COMPDUMP"
else
  compinit -i -d "$ZSH_COMPDUMP"; touch "$ZSH_COMPDUMP"
fi

{
  # compile .zcompdump
  if [[ -s "$ZSH_COMPDUMP" && (! -s "${ZSH_COMPDUMP}.zwc" || "$ZSH_COMPDUMP" -nt "${ZSH_COMPDUMP}.zwc") ]]; then
    zcompile "$ZSH_COMPDUMP"
  fi
} &!

# zstyles
[[ -r $ZDOTDIR/.zstyles ]] && . $ZDOTDIR/.zstyles

# use antidote for plugin management
export ANTIDOTE_HOME=${XDG_CACHE_HOME:=~/.cache}/repos
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

# done profiling
[[ -z "$ZPROFRC" ]] || zprof

# cleanup
unset ZPROFRC zplugins
true

# vim: ft=zsh sw=2 ts=2 et
# # >>> conda initialize >>>
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
  . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi
# # <<< conda initialize <<<

# pnpm
# export PNPM_HOME="/home/isaac/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end

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
)
