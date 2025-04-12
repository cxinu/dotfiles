#!/bin/bash

file="$HOME/.config/picom.conf"

if [[ "$(sed -n '22p' "$file")" =~ ^[[:space:]]*# ]]; then
  sed -i '22s/^# //' $file
  sed -i '49s/95/75/' $file
else
  sed -i '22s/^/# /' $file
  sed -i '49s/75/95/' $file
fi
