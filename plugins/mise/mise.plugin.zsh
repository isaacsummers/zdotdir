export MISE_SHELL=zsh
export __MISE_ORIG_PATH="$PATH"

mise() {
  local command
  command="${1:-}"
  if [ "$#" = 0 ]; then
    command C:/users/isummers/.local/bin/mise.exe
    return
  fi
  shift

  case "$command" in
  deactivate|shell|sh)
    # if argv doesn't contains -h,--help
    if [[ ! " $@ " =~ " --help " ]] && [[ ! " $@ " =~ " -h " ]]; then
      safe_eval "$(command C:/users/isummers/.local/bin/mise.exe "$command" "$@")"
      return $?
    fi
    ;;
  esac
  command C:/users/isummers/.local/bin/mise.exe "$command" "$@"
}

_mise_hook() {
  local cmd_hook_env="$(C:/users/isummers/.local/bin/mise.exe hook-env -s zsh)";
  if [ -n "$cmd_hook_env" ]; then
    eval "$(fix_windows_path $cmd_hook_env)"
  fi
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_mise_hook]+1}" ]]; then
  precmd_functions=( _mise_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_mise_hook]+1}" ]]; then
  chpwd_functions=( _mise_hook ${chpwd_functions[@]} )
fi

if [ -z "${_mise_cmd_not_found:-}" ]; then
    _mise_cmd_not_found=1
    [ -n "$(declare -f command_not_found_handler)" ] && safe_eval "${$(declare -f command_not_found_handler)/command_not_found_handler/_command_not_found_handler}"

    function command_not_found_handler() {
        if C:/users/isummers/.local/bin/mise.exe hook-not-found -s zsh -- "$1"; then
          _mise_hook
          "$@"
        elif [ -n "$(declare -f _command_not_found_handler)" ]; then
            _command_not_found_handler "$@"
        else
            echo "zsh: command not found: $1" >&2
            return 127
        fi
    }
fi
