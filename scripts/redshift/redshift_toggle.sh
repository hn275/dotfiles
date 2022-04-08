#!/usr/bin/bash


# Toggling redshift

DIR=$HOME/.config
CONF=$DIR/redshift/redshift.conf
SCRIPT=$DIR/scripts/redshift/redshift.py

send_noti () {
	dunstify -u low $@
}

python $SCRIPT -s # Swap the state, 1 to activate, 0 to pkill

if [ $(python $SCRIPT -get) -eq 1 ];then
	# Kill redshift incase there's one running
	if pgrep -x redshift > /dev/null
	then
		pkill redshift
	fi
	# Activate redshift
	send_noti Redshift activated
	redshift -c $CONF &
	exit 0
elif [ $(python $SCRIPT -get) -eq 0 ];then
	send_noti Redshift deactivated
	pgrep -x redshift | pkill redshift
	exit 0
fi


