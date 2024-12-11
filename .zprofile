echo "Loading zprofile"

if [[ "$TERM_PROGRAM" == "vscode-" ]]; then
    typeset -gxU prepath
    prepath=(
        $XDG_DATA_HOME/mise/shims(N)
        $prepath
    )
fi
