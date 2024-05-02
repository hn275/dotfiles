#!/usr/bin/env bash

id=$(dunstify -a Screenshot -u low -t 2000 "Screenshot mode" --printid)
SELECTED=$(slop -f "-i %i -g %g")
name=$1
[[ -z $name ]] && name="screenshot"

SCREENSHOT_PATH="$HOME/Pictures/Screenshots/$name.png"
if [[ -z $SELECTED ]]; then
    exit 0
fi

shotgun $SELECTED "${SCREENSHOT_PATH}" && \
    dunstify -a Screenshot -u low -t 2000 "Screenshot saved at ${SCREENSHOT_PATH}" -r $id
