#! /usr/bin/bash

# This scripts is for the power button on polybar

# Set variables
DIR="$HOME/.config/rofi/src/powermenu"
SCRIPTS="$HOME/.config/scripts/power_options"

ICON_LOGOUT=""
ICON_SLEEP=""
ICON_SHUTDOWN=""
ICON_REBOOT=""

LOCK="$ICON_LOGOUT Lock"
SLEEP="$ICON_SLEEP Sleep"
SHUTDOWN="$ICON_SHUTDOWN Shutdown"

ICON_YES=""

OPTIONS="${ICON_LOGOUT}|${ICON_SLEEP}|${ICON_REBOOT}|${ICON_SHUTDOWN}"


# Defining Functions
power_menu () {
	echo $OPTIONS | \
		rofi \
		-dmenu \
		-sep "|" \
		-theme $DIR/power.rasi \
		-me-select-entry '' \
		-me-accept-entry MousePrimary
}


confirm_action () {
	echo "Yes|No" | rofi \
		-dmenu \
		-sep "|" \
		-theme $DIR/confirm.rasi \
		-me-select-entry '' \
		-me-accept-entry MousePrimary \
		-p "${1} now?"
}


system_logout () {
	ans=$(confirm_action "Logout")
	if [ $ans == "Yes" ];then
		bspc quit
	else
		exit 0
	fi
}



system_sleep () {
	ans=$(confirm_action "Suspend")
	if [ $ans == "Yes" ]
	then
		$SCRIPTS/lockscreen.sh && systemctl suspend
	else
		exit 0
	fi
}


system_shutdown () {
	ans=$(confirm_action "Shutdown")
	if [ $ans == "Yes" ]
	then
		systemctl poweroff
	else
		exit 0
	fi
}


system_reboot () {
	ans=$(confirm_action "Reboot")
	if [ $ans == "Yes" ]
	then
		reboot
	else
		exit 0
	fi
}

# Case
case $(power_menu) in 
	$ICON_LOGOUT)
		system_logout
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
	*) 
		exit 0
		;;	
esac
