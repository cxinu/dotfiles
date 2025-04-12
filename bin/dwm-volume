#!/bin/bash

ICON_HIGH=" "
ICON_MID=" "
ICON_LOW=" "
ICON_MUTE=" "

# Function to get volume
get_volume() {
    volume=$(pamixer --get-volume)
    mute_status=$(pamixer --get-mute)

    if [ "$mute_status" = "true" ]; then
        echo "${ICON_MUTE}Muted"
    else
        if [ "$volume" -ge 40 ]; then
            icon=$ICON_HIGH
        elif [ "$volume" -ge 1 ]; then
            icon=$ICON_MID
        else
            icon=$ICON_LOW
        fi
        echo "${icon}${volume}%"
    fi
}

# Output volume
get_volume
