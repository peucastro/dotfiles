#!/bin/bash

TMPFILE="$HOME/.config/hypr/.brightness_backup"

mkdir -p "$(dirname "$TMPFILE")"
brightnessctl -s set 10

>"$TMPFILE"
for id in $(ddcutil detect | grep -E '^Display [0-9]+' | awk '{print $2}'); do
    current=$(sudo ddcutil --display="$id" getvcp 10 2>/dev/null | grep "VCP code 0x10" | awk -F 'current value = |, max' '{print $2}' | tr -d ' ')
    if [[ "$current" =~ ^[0-9]+$ ]]; then
        echo "$id $current" >>"$TMPFILE"
        sudo ddcutil --display="$id" setvcp 10 10
    fi
done
