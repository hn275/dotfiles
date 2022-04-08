#! /usr/bin/bash

# This scripts is for the power button on polybar

# Set variables
DIR="$HOME/.config/rofi/src/powermenu"
SCRIPTS="$HOME/.config/scripts/power_options"

ICON_LOCK=""
ICON_SLEEP=""
ICON_SHUTDOWN=""
ICON_REBOOT=""

OPTIONS="${ICON_LOCK}|${ICON_SLEEP}|${ICON_REBOOT}|${ICON_SHUTDOWN}"


# Calling Rofi
power_menu () {
	echo $OPTIONS | \
		rofi \
		-dmenu \
		-sep "|" \
		-theme $DIR/power.rasi \
		-me-select-entry '' \
		-me-accept-entry MousePrimary
}

# Confirming messages
confirm_action () {
	rofi -dmenu -p "${1}? (Y/n)" -theme $DIR/confirm_action.rasi
}

# Lock
system_lock () {
	sleep 0.1 && $SCRIPTS/lockscreen.sh
}

# Suspend
system_sleep () {
	ans=$(confirm_action Suspend)
	if [ $ans == "y" ] || [ $ans == "yes" ] || [ $ans == "Y" ] || [ $ans == "Yes" ]
	then
		system_lock && systemctl suspend
	else
		exit 0
	fi
}

# Shutdown
system_shutdown () {
	ans=$(confirm_action "Shutdown")
	if [ $ans == "y" ] || [ $ans == "yes" ] || [ $ans == "Y" ] || [ $ans == "Yes" ]
	then
		systemctl poweroff
	else
		exit 0
	fi
}

# Restart
system_reboot () {
	ans=$(confirm_action Reboot)
	if [ $ans == "y" ] || [ $ans == "yes" ] || [ $ans == "Y" ] || [ $ans == "Yes" ];then
		systemctl reboot
	else
		exit 0
	fi
}


# Case
case $(power_menu) in 
	$ICON_LOCK)
		system_lock
		;;
	$ICON_SLEEP)
		system_sleep
		;;
	$ICON_SHUTDOWN)
		system_shutdown
		;;
	$ICON_REBOOT)
		system_reboot
		;;
esac
