#!/usr/bin/bash

# Dimmed between 10:30pm and 5:30am

DIR=$HOME/.config/scripts/startups/dim_light

STATE=$(python $DIR/get_state.py)

if [[ $STATE -eq 1 ]];then
	brillo -S 3
	kbdlight set 15
	pulsemixer --set-volume 20
elif [[ $STATE -eq 0 ]];then
	exit 0
fi
