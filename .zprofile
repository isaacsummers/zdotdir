if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  path=($HOME/.local/share/mise/shims(N) $path)
  # safe_eval_export 'eval "$($HOME/.local/bin/mise activate zsh)"'
elif; then
  safe_eval_export 'eval "$($HOME/.local/bin/mise activate zsh)"'
fi
