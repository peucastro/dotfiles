#!/bin/bash

DEST=~/Pictures/screenshots
FILE="$DEST/Screenshot-$(date +%F_%T).png"

grim - | wl-copy &&
  wl-paste >"$FILE" &&
  notify-send \
    -h "string:hlcolor:#a9b665" \
    -i camera-photo \
    "Screenshot" \
    "Saved to $FILE and copied to clipboard"
