typeset evals
evals=(
  # "pyenv:pyenv init --path"
  "pyenv:pyenv init -"
  "pyenv-virtualenv:pyenv virtualenv-init -"
  "pip:pip completion --zsh"
  "pipx:register-python-argcomplete pipx"
  "pipenv:_PIPENV_COMPLETE=zsh_source pipenv"
  "navi:navi widget zsh"
  "fzf:fzf --zsh"
  "zoxide:zoxide init zsh --cmd cd"
)

for index in "${evals[@]}"; do
  # Split the value into name and command
  IFS=":" read -r name cmd <<<"${index}"
  # Extract the actual command name from $cmd
  cmd_name=$(echo $cmd | awk '{print $1}')
  if [[ $- == *i* ]]; then # check if the shell is interactive
    eval_command="eval \"\$($cmd)\""
    eval "$eval_command" >/dev/null 2>&1 || echo "Failed to execute: $eval_command"
  fi
done