# safe_eval_export 'eval "$(mise activate zsh)"'

export MISE_ENV_FILE=.env
export MISE_TOOL_OPTS__VIRTUALENV=.venv
export MISE_PYTHON_COMPILE=1
export PYTHON_BUILD_FREE_THREADING=1


if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  # path=($HOME/.local/share/mise/shims(N) $path)
  safe_eval_export 'eval "$($HOME/.local/bin/mise activate zsh)"'
elif; then
  safe_eval_export 'eval "$($HOME/.local/bin/mise activate zsh)"'
fi
