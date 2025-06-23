#!/bin/bash

case "$1" in
    "up")
        brightnessctl -e4 -n2 set 5%+
        ~/.config/hypr/scripts/notifications/media-notify.sh brightness
        ;;
    "down")
        brightnessctl -e4 -n2 set 5%-
        ~/.config/hypr/scripts/notifications/media-notify.sh brightness
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
