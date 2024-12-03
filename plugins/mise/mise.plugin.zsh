# export MISE_SHELL=zsh
# export __MISE_ORIG_PATH="$PATH"

# mise() {
#   local command
#   command="${1:-}"
#   if [ "$#" = 0 ]; then
#     command C:/users/isummers/.local/bin/mise.exe
#     return
#   fi
#   shift

#   case "$command" in
#   deactivate|shell|sh)
#     # if argv doesn't contains -h,--help
#     if [[ ! " $@ " =~ " --help " ]] && [[ ! " $@ " =~ " -h " ]]; then
#       safe_eval "$(command C:/users/isummers/.local/bin/mise.exe "$command" "$@")"
#       return $?
#     fi
#     ;;
#   esac
#   command C:/users/isummers/.local/bin/mise.exe "$command" "$@"
# }

# _mise_hook() {
#   local cmd_hook_env="$(C:/users/isummers/.local/bin/mise.exe hook-env -s zsh)";
#   if [ -n "$cmd_hook_env" ]; then
#     eval "$(fix_windows_path $cmd_hook_env)"
#   fi
# }
# typeset -ag precmd_functions;
# if [[ -z "${precmd_functions[(r)_mise_hook]+1}" ]]; then
#   precmd_functions=( _mise_hook ${precmd_functions[@]} )
# fi
# typeset -ag chpwd_functions;
# if [[ -z "${chpwd_functions[(r)_mise_hook]+1}" ]]; then
#   chpwd_functions=( _mise_hook ${chpwd_functions[@]} )
# fi

# if [ -z "${_mise_cmd_not_found:-}" ]; then
#     _mise_cmd_not_found=1
#     [ -n "$(declare -f command_not_found_handler)" ] && safe_eval "${$(declare -f command_not_found_handler)/command_not_found_handler/_command_not_found_handler}"

#     function command_not_found_handler() {
#         if C:/users/isummers/.local/bin/mise.exe hook-not-found -s zsh -- "$1"; then
#           _mise_hook
#           "$@"
#         elif [ -n "$(declare -f _command_not_found_handler)" ]; then
#             _command_not_found_handler "$@"
#         else
#             echo "zsh: command not found: $1" >&2
#             return 127
#         fi
#     }
# fi

# safe_eval() {
#   local input="$1"
#   # echo "safe_eval: $input"
#   # Replace single and double backslashes with forward slashes
#   local fixed_input=$(echo -E "$input" | sed 's/\\\\/\\/g; s/\\/\//g')
#   builtin eval "$fixed_input"
#   # echo -E $fixed_input
# }

# safe_export() {
#   local output_path="$1"
#   local var_name=""
#   local var_value=""

#   # Check if the input contains '='
#   if [[ "$output_path" == *"="* ]]; then
#     var_name="${output_path%%=*}"
#     var_value="${output_path#*=}"
#   else
#     var_value="$output_path"
#   fi

#   # Check if the script is running on Windows
#   if [[ "$(uname -s)" == CYGWIN* || "$(uname -s)" == MINGW* || "$(uname -s)" == MSYS* ]]; then
#     # Convert the path to Unix format using cygpath
#     var_value=$(cygpath -up "$var_value")
#   fi

#   # Call the original export function with the converted path
#   if [[ -n "$var_name" ]]; then
#     builtin export "$var_name=$var_value"
#   else
#     builtin export "$var_value"
#   fi
# }

# # Overwrite eval
# eval() {
#   echo "Custom eval called with: $@"
#   command safe_eval "$@"
# }

# # Overwrite export
# export() {
#   echo "Custom export called with: $@"
#   command safe_export "$@"
# }

safe_eval_export 'eval "$(mise activate zsh)"'
