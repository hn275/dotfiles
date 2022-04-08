#! /usr/bin/bash

# Brightness control

DIR=$HOME/.config/scripts/brightness_control/


get_brightness_value () {
	python $DIR/brightness_value.py
}

send_notification () {
	dunstify \
		-i $DIR/icons/brightness.png \
		-h int:value:"`brillo [-G]`" \
		-h string:x-dunst-stack-tag:brightness \
		--urgency=low \
		Screen $(get_brightness_value)%
}


case $1 in 
	"up")
		brillo -A 3 -u 25000 && send_notification
		;;
	"down")
		brillo -U 3 -u 25000 && send_notification
		;;
esac
