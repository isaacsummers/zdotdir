

typeset -A evals
evals[pyenv]="pyenv init -"
evals[virtualenv]="pyenv virtualenv-init -"
evals[thefuck]="thefuck --alias"
# evals[bw]="bw completion --shell zsh"
evals[ngrok]="ngrok completion" 
evals[navi]="navi widget zsh"

# Using associative arrays in zsh with loops:
for name in "${(@k)evals}"; do
  cmd="${evals[$name]}"
  if command -v ${cmd%% *} &>/dev/null; then
    eval "$(eval $cmd)"
  fi  
done