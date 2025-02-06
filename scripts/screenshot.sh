#!/bin/bash

# Check if XDG_RUNTIME_DIR is set
if [ -z "$XDG_RUNTIME_DIR" ]; then
    # If not set, create the directory and set the environment variable
    export XDG_RUNTIME_DIR=/run/user/$UID
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 0700 "$XDG_RUNTIME_DIR"
fi

# Run Flameshot with the updated environment
flameshot gui
