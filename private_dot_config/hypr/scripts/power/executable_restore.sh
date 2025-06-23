#!/bin/bash

TMPFILE="$HOME/.config/hypr/.brightness_backup"

brightnessctl -r

if [ -f "$TMPFILE" ]; then
    while read -r id brightness; do
        if [[ "$id" =~ ^[0-9]+$ ]] && [[ "$brightness" =~ ^[0-9]+$ ]]; then
            sudo ddcutil --display="$id" setvcp 10 "$brightness"
        fi
    done <"$TMPFILE"
    rm -f "$TMPFILE"
fi
