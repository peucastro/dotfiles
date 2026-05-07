#!/bin/bash

grim -g "$(slurp)" - | swappy -f - &&
  notify-send \
    -h "string:hlcolor:#a9b665" \
    -i camera-photo \
    "Screenshot" \
    "Region captured in Swappy"
