# eval_export 'eval "$(mise activate zsh)"'
echo 'Loading mise.plugin.zsh'
export MISE_ENV_FILE=.env
export MISE_TOOL_OPTS__VIRTUALENV=.venv
export MISE_PYTHON_COMPILE=1
export PYTHON_BUILD_FREE_THREADING=1

if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  path=($HOME/.local/share/mise/shims(N) $path)
  # safe_eval_export 'eval "$($HOME/.local/bin/mise activate zsh)"'
else
  export MISE_SHELL=zsh
  export __MISE_ORIG_PATH="$PATH"

  mise() {
    local command
    command="${1:-}"
    if [ "$#" = 0 ]; then
      command ~/.local/bin/mise
      return
    fi
    shift

    case "$command" in
    deactivate|shell|sh)
      # if argv doesn't contains -h,--help
      if [[ ! " $@ " =~ " --help " ]] && [[ ! " $@ " =~ " -h " ]]; then
        eval "$(command ~/.local/bin/mise "$command" "$@")"
        return $?
      fi
      ;;
    esac
    command ~/.local/bin/mise "$command" "$@"
  }

  # original mise hook
  # _mise_hook() {
  #   eval "$(C:\Users\ISummers\.local\bin\mise.exe hook-env -s zsh)";
  # }

  # fixed mise hook using cygpath to convert export lines with Windows paths to Unix paths
  _mise_hook() {
      local _mise_hook_env
      _mise_hook_env="$(~/.local/bin/mise hook-env -s zsh)"

      # Split the environment variables into an array of lines
      local _mise_hook_env_lines
      _mise_hook_env_lines=("${(@f)_mise_hook_env}")

      # Loop through each line
      for line in "${_mise_hook_env_lines[@]}"; do
          if [[ $line == export* ]]; then
              # Extract the key and value from the export statement
              local key value
              key="${line#export }"
              key="${key%%=*}"
              value="${line#*=}"

              # Strip surrounding single quotes if present
              if [[ "$value" == \'*\' ]]; then
                  value="${value:1:-1}"
              fi

              # Convert the entire value using cygpath -up
              local new_value
              new_value=$(cygpath -up "$value")

              # Reconstruct the export statement with the converted paths
              eval "export $key=\"$new_value\"" >/dev/null 2>&1
          else
              # Evaluate non-export lines as is, suppressing output
              eval "$line" >/dev/null 2>&1
          fi
      done
  }

  # Add _mise_hook to precmd_functions and chpwd_functions
  typeset -ag precmd_functions
  if [[ -z "${precmd_functions[(r)_mise_hook]+1}" ]]; then
      precmd_functions=( _mise_hook "${precmd_functions[@]}" )
  fi

  typeset -ag chpwd_functions
  if [[ -z "${chpwd_functions[(r)_mise_hook]+1}" ]]; then
      chpwd_functions=( _mise_hook "${chpwd_functions[@]}" )
  fi

  _mise_hook
  if [ -z "${_mise_cmd_not_found:-}" ]; then
      _mise_cmd_not_found=1
      [ -n "$(declare -f command_not_found_handler)" ] && eval "${$(declare -f command_not_found_handler)/command_not_found_handler/_command_not_found_handler}"

      function command_not_found_handler() {
          if ~/.local/bin/mise hook-not-found -s zsh -- "$1"; then
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


fi
echo 'mise.plugin.zsh loaded'
