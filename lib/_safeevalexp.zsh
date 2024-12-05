# echo "Loading safe_eval & safe_export functions"
system_type=$(uname -s)
# echo "System_type: $system_type"

safe_eval() {
  local input="$1"

  # Replace single and double backslashes with forward slashes
  # if [[ "$system_type" == "MINGW"* || "$system_type" == "MSYS"* || "$system_type" == "CYGWIN"* ]]; then
  local fixed_input=$(echo -E "$input" | sed 's/\\\\/\\/g; s/\\/\//g')
  # else
  #   local fixed_input="$input"
  # fi

  # Temporarily override export within safe_eval
  export() {
    safe_export "$@"
  }

  # Execute the command
  builtin eval "$fixed_input"

  # Restore original export
  unset -f export
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
  if [[ "$system_type" == "CYGWIN"* || "$system_type" == "MINGW"* || "$system_type" == "MSYS"* ]]; then
    # Convert the path to Unix format using cygpath
    var_value=$(cygpath -up "$var_value")
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

  # Temporarily override eval
  eval() {
    safe_eval "$@"
  }

  # Execute the command
  builtin eval "$command"

  # Restore original eval
  unset -f eval
}
