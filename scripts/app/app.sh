#!/usr/bin/bash

fail() {
    echo "$msg"
    notify-send -a "App Launcher" "$msg"
    exit 1
}

[ -z "$1" ] && fail

msg="Invalid app \"$1\". Acceptable arguments:
- brightspace | bs
- calendar | cal
- mail"

case $1 in
    brightspace|bs)
        xdg-open "https://bright.uvic.ca/d2l/home"
        ;;
    calendar|cal)
        xdg-open "https://calendar.proton.me/"
        ;;
    mail)
        xdg-open "https://mail.proton.me/"
        ;;
    *)
        fail
        ;;
esac
