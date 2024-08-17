#!/bin/zsh

# Path to the INI file
EXTENSIONS_FILE="vscode-extensions.ini"

# Read each line in the file
while read -r line; do
    # Skip lines starting with a semicolon
    if [[ $line != \;* ]]; then
        # Install the extension
        code-insiders --install-extension "$line"
    fi
done < $EXTENSIONS_FILE
