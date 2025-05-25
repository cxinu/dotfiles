#!/bin/bash

# Kill already running bars
killall -q polybar

# Wait until they're really dead
while pgrep -x polybar >/dev/null; do sleep 0.2; done

# Launch Polybar
polybar example &
