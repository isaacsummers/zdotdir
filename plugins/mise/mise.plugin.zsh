eval "$(mise activate zsh)"
# eval "$(mise activate zsh --shims)"
# when mise is available run `eval "$(uv generate-shell-completion zsh)"`

# Check if `uv` is available after `mise` is activated
if command -v uv &> /dev/null; then
  eval "$(uv generate-shell-completion zsh)"
fi
