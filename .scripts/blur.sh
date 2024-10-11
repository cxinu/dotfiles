#!/bin/bash

file="$HOME/.config/picom.conf"

if [[ "$(sed -n '22p' "$file")" =~ ^[[:space:]]*# ]]; then
  sed -i '22s/^# //' $file
else
  sed -i '22s/^/# /' $file
fi
