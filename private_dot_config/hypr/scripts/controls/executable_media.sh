#!/bin/bash

get_player_info() {
    local status=$(playerctl status 2>/dev/null || echo "No player")
    local title=$(playerctl metadata title 2>/dev/null || echo "Unknown")
    local artist=$(playerctl metadata artist 2>/dev/null || echo "Unknown Artist")
    echo "$status|$title|$artist"
}

media_notify() {
    local action="$1"
    local info=$(get_player_info)
    local status=$(echo "$info" | cut -d'|' -f1)
    local title=$(echo "$info" | cut -d'|' -f2)
    local artist=$(echo "$info" | cut -d'|' -f3)

    local icon="media-playback-start"
    local message="$title"

    case "$status" in
        "Playing")
            icon="media-playback-start"
            message="▶ $title"
            ;;
        "Paused")
            icon="media-playback-pause"
            message="⏸ $title"
            ;;
        "Stopped")
            icon="media-playback-stop"
            message="⏹ Stopped"
            ;;
        *)
            icon="media-playback-start"
            message="No media playing"
            ;;
    esac

    if [ "$artist" != "Unknown Artist" ] && [ "$title" != "Unknown" ]; then
        message="$message\n$artist"
    fi

    notify-send -h string:x-canonical-private-synchronous:media \
        -h string:hlcolor:#d3869b \
        -i "$icon" \
        "Media" "$message"
}

case "$1" in
    "play-pause")
        playerctl play-pause 2>/dev/null
        sleep 0.1
        media_notify "play-pause"
        ;;
    "next")
        playerctl next 2>/dev/null
        sleep 0.1
        media_notify "next"
        ;;
    "previous")
        playerctl previous 2>/dev/null
        sleep 0.1
        media_notify "previous"
        ;;
    *)
        echo "Usage: $0 {play-pause|next|previous}"
        exit 1
        ;;
esac
