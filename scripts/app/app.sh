#!/usr/bin/bash

[ -z "$1" ] && exit 1

msg="Invalid app \"$1\". Acceptable arguments:
- todoist | todo
- brightspace | bs
- calendar | cal"

case $1 in
    todo|todoist)
        xdg-open "https://app.todoist.com/app/today"
        ;;
    brightspace|bs)
        xdg-open "https://bright.uvic.ca/d2l/home"
        ;;
    calendar|cal)
        xdg-open "https://calendar.google.com/calendar"
        ;;
    *)
        echo "$msg"
        notify-send -a "App Launcher" "$msg"
        exit 1
        ;;
esac
