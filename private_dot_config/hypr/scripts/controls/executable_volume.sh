#!/bin/bash

case "$1" in
    "up")
        if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        else
            wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        fi
        ~/.config/hypr/scripts/notifications/media-notify.sh volume
        ;;
    "down")
        if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
            ~/.config/hypr/scripts/notifications/media-notify.sh volume
        else
            wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
            ~/.config/hypr/scripts/notifications/media-notify.sh volume
        fi
        ;;
    "mute")
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ~/.config/hypr/scripts/notifications/media-notify.sh volume
        ;;
    "mic-mute")
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        ~/.config/hypr/scripts/notifications/media-notify.sh microphone
        ;;
    *)
        echo "Usage: $0 {up|down|mute|mic-mute}"
        exit 1
        ;;
esac
