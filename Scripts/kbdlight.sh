#!/usr/bin/bash

# Control keyboard backlight with brightnessctl

DEVICE=smc::kbd_backlight

polybar_ipc () {
	if pgrep -x polybar;
	then
		if pgrep -x redshift > /dev/null;then
			polybar-msg action "#kbdlight.hook.1"
		else
			polybar-msg action "#kbdlight.hook.0"
		fi
	fi
}

kbd_up () {
	brightnessctl -d $DEVICE set +20%
	polybar_ipc
}

kbd_down () {
	brightnessctl -d $DEVICE set 20%-
	polybar_ipc
}

case $@ in
	"up")
		kbd_up
		;;
	"down")
		kbd_down
		;;
	*)
		polybar_ipc
		;;
esac

