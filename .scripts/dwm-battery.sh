#!/bin/bash

BAT_PATH="/sys/class/power_supply/BAT0"

capacity=$(cat "$BAT_PATH/capacity")
status=$(cat "$BAT_PATH/status")

# ANSI color codes
COLOR_RESET="\x1b[0m"   # Reset to default color
COLOR_BLUE="\x1b[34m"   # Blue
COLOR_GREEN="\x1b[32m"  # Green (used for normal battery levels)
COLOR_YELLOW="\x1b[33m" # Yellow (for medium battery levels)
COLOR_RED="\x1b[31m"    # Red (for low battery levels)

if [ "$status" = "Not charging" ]; then # on AC
    icon=" "
    color=$COLOR_BLUE
elif [ "$capacity" -gt 75 ]; then
    icon=" "
elif [ "$capacity" -gt 50 ]; then
    icon=" "
elif [ "$capacity" -gt 25 ]; then
    icon=" "
elif [ "$capacity" -gt 10 ]; then
    icon=" "
    color=$COLOR_RED
else
    icon=" "
    color=$COLOR_RED
fi

if [[ "$status" = "Charging" ]]; then
    color=$COLOR_BLUE
fi

echo -e "$icon${capacity}%"
