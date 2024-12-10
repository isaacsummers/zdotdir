SAFE_EVAL_DEBUG=false

safe_eval() {
  local input="$1"

  # Replace single and double backslashes with forward slashes
  local fixed_input=$(echo -E "$input" | sed 's/\\\\/\\/g; s/\\/\//g')

  # Print debug information if SAFE_EVAL_DEBUG is true
  if $SAFE_EVAL_DEBUG; then
    echo "safe_eval: Executing command: $fixed_input"
  fi

  # Execute the command
  builtin eval "$fixed_input"
}

safe_export() {
  local output_path="$1"
  local var_name=""
  local var_value=""

  # Check if the input contains '='
  if [[ "$output_path" == *"="* ]]; then
    var_name="${output_path%%=*}"
    var_value="${output_path#*=}"
  else
    var_value="$output_path"
  fi

  # Check if the script is running on Windows
  if [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Convert the path to Unix format using cygpath
    var_value=$(cygpath -up "$var_value")
  fi

  # Replace single and double backslashes with forward slashes in var_value
  var_value=$(echo -E "$var_value" | sed 's/\\\\/\\/g; s/\\/\//g')

  # Print debug information if SAFE_EVAL_DEBUG is true
  if $SAFE_EVAL_DEBUG; then
    echo "safe_export: Exporting variable: $var_name=$var_value"
  fi

  # Call the original export function with the converted path
  if [[ -n "$var_name" ]]; then
    builtin export "$var_name=$var_value"
  else
    builtin export "$var_value"
  fi
}

safe_eval_export() {
  local command="$1"

  # Save original eval and export functions
  local original_eval
  local original_export
  original_eval=$(typeset -f eval)
  original_export=$(typeset -f export)

  # Temporarily override eval
  eval() {
    safe_eval "$@"
  }

  # Temporarily override export
  export() {
    safe_export "$@"
  }

  # Print debug information if SAFE_EVAL_DEBUG is true
  if $SAFE_EVAL_DEBUG; then
    echo "safe_eval_export: Executing command: $command"
  fi

  # Execute the command
  local output
  output=$(builtin eval "$command")

  # Print the output
  echo -E "$output"

  # Restore original eval and export functions
  if [[ -n "$original_eval" ]]; then
    eval "$original_eval"
  else
    unset -f eval
  fi

  if [[ -n "$original_export" ]]; then
    eval "$original_export"
  else
    unset -f export
  fi
}

# Example usage
# safe_eval_export "$(mise activate zsh)"
