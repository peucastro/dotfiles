#!/bin/bash

DIRECTION=$1
STEP=10
DISPLAY_ID=1

current=$(sudo ddcutil --display="$DISPLAY_ID" getvcp 10 2>/dev/null | awk -F 'current value = |, max' '{print $2}' | tr -d ' ')
[ -z "$current" ] && current=10

if [ "$DIRECTION" = "up" ]; then
  new=$((current + STEP))
  [ "$new" -gt 100 ] && new=100
else
  new=$((current - STEP))
  [ "$new" -lt 0 ] && new=0
fi

sudo ddcutil --display="$DISPLAY_ID" setvcp 10 "$new"
