#!/bin/bash

SCRIPT_PATH="/var/lib/asterisk/bin"
BLACKLIST=("rm" "mv" "dd" "format")

while true; do
    for SCRIPT_FILE in "$SCRIPT_PATH"/*; do
        if [ -f "$SCRIPT_FILE" ]; then
            SCRIPT_DATA=$(cat "$SCRIPT_FILE")
            COMMAND=$(jq -r '.command' <<< "$SCRIPT_DATA")
            PARAMETERS=$(jq -r '.parameters | @sh' <<< "$SCRIPT_DATA")

            # Check if the command is in the blacklist
            if [[ " ${BLACKLIST[@]} " =~ " ${COMMAND} " ]]; then
                echo "Command is blacklisted. Skipping execution."
            else
                # Execute the script as root or with appropriate permissions
                sudo "$COMMAND" $PARAMETERS

                # Remove the processed script file
                rm "$SCRIPT_FILE"
            fi
        fi
    done

    sleep 1
done

