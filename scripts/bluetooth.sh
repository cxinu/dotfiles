#!/bin/bash
# Unblock Bluetooth
rfkill unblock bluetooth

# Start bluetoothctl commands
bluetoothctl << EOF
power on
agent on
default-agent
disconnect
scan on
connect 98:34:8C:EC:86:2B
EOF
