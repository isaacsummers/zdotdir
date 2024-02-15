#
# prompt
#

prompt_nix_shell_setup
# remove right prompt for prior commands
setopt transient_rprompt

# initialize prompt
autoload -Uz promptinit && promptinit

# prompt starship mmc
# prompt p10k pure
prompt p10k mmc
