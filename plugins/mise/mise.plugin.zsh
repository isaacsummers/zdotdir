# eval_export 'eval "$(mise activate zsh)"'
echo 'Loading mise.plugin.zsh'
export MISE_ENV_FILE=.env
# export MISE_TOOL_OPTS__VIRTUALENV=.venv
# export MISE_PYTHON_COMPILE=1
# export PYTHON_BUILD_FREE_THREADING=1

if [[ "$TERM_PROGRAM" != "vscode-" ]]; then

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

    _mise_hook() {
        # Capture the output of the mise hook-env command
        local mise_output
        mise_output=$(mise hook-env -s zsh)

        # Process each export statement individually
        while IFS= read -r line; do
            if [[ $line == export* ]]; then
                # Extract the variable name and value
                var_name=${line#export }
                var_name=${var_name%%=*}
                var_value=${line#*=}

                # Remove single quotes if present
                if [[ "$var_value" == \'*\' ]]; then
                    var_value="${var_value:1:-1}"
                fi

                # Special handling for PATH variable
                if [[ "$var_name" == "PATH" || "$var_name" == *"DIR"* ]]; then
                    var_value=$(cygpath -up "$var_value")
                    export "$var_name"="$var_value"
                else
                    # Export the variable as is
                    export "$var_name=$var_value"
                fi
            else
                # Evaluate non-export lines as is
                eval "$line"
            fi
        done <<< "$mise_output"
    }

    # Hook into zsh
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

    # initial call to hook
    _mise_hook
fi
echo 'mise.plugin.zsh loaded'
