#!/usr/bin/bash

# Control backlight keyboard and set notification to via dunst


DIR=$HOME/.config/scripts/kbdlight_control
ICON=$DIR/icons/keyboard.png

getbrightness () {
	python $DIR/getbrightness.py
}

dunst_notification () {
	dunstify \
		Keyboard $(getbrightness)% \
		-h int:value:"`getbrightness`" \
		-h string:x-dunst-stack-tag:brightness_kbd \
		-i $ICON \
		--urgency=low
}

kbd_up () {
	kbdlight up 10
	dunst_notification
}

kbd_down () {
	kbdlight down 10
	dunst_notification
}

case $@ in
	"up")
		kbd_up
		;;
	"down")
		kbd_down
		;;
esac

