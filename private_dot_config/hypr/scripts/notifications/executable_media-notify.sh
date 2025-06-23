#!/bin/bash

get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2*100)}'
}

is_muted() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"
}

get_brightness() {
    brightnessctl get | awk -v max="$(brightnessctl max)" '{print int(($1/max)*100)}'
}

get_external_brightness() {
    local display_id=${1:-1}
    local brightness=$(sudo ddcutil --display="$display_id" getvcp 10 2>/dev/null | grep "VCP code 0x10" | awk -F 'current value = |, max' '{print $2}' | tr -d ' ')
    echo "${brightness:-0}"
}

volume_notify() {
    local volume=$(get_volume)
    local icon="audio-volume-high"
    local message="${volume}%"

    if is_muted; then
        icon="audio-volume-muted"
        message="Muted"
    elif [ "$volume" -eq 0 ]; then
        icon="audio-volume-muted"
    elif [ "$volume" -lt 33 ]; then
        icon="audio-volume-low"
    elif [ "$volume" -lt 66 ]; then
        icon="audio-volume-medium"
    fi

    notify-send -h int:value:$volume \
        -h string:x-canonical-private-synchronous:volume \
        -h string:hlcolor:#fabd2f \
        -i "$icon" \
        "Volume" "$message"
}

brightness_notify() {
    local brightness=$(get_brightness)
    local icon="display-brightness-symbolic"

    notify-send -h int:value:$brightness \
        -h string:x-canonical-private-synchronous:brightness \
        -h string:hlcolor:#b8bb26 \
        -i "$icon" \
        "Brightness" "${brightness}%"
}

external_brightness_notify() {
    local display_id=${1:-1}
    local brightness=$(get_external_brightness "$display_id")
    local icon="display-brightness-symbolic"

    notify-send -h int:value:$brightness \
        -h string:x-canonical-private-synchronous:external_brightness \
        -h string:hlcolor:#83a598 \
        -i "$icon" \
        "External Brightness" "${brightness}%"
}

mic_notify() {
    local muted=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED" && echo "true" || echo "false")
    local icon="audio-input-microphone"
    local message="Microphone"

    if [ "$muted" = "true" ]; then
        icon="audio-input-microphone-muted"
        message="Microphone Muted"
    else
        message="Microphone Active"
    fi

    notify-send -h string:x-canonical-private-synchronous:microphone \
        -h string:hlcolor:#d3869b \
        -i "$icon" \
        "$message"
}

case "$1" in
    "volume")
        volume_notify
        ;;
    "brightness")
        brightness_notify
        ;;
    "external-brightness")
        external_brightness_notify "$2"
        ;;
    "microphone")
        mic_notify
        ;;
    *)
        echo "Usage: $0 {volume|brightness|external-brightness [display_id]|microphone}"
        exit 1
        ;;
esac
