#!/usr/bin/bash

# Polybar
usrpolybar & > /dev/null

# Nightshift?
if pgrep -x redshift > /dev/null;then
	polybar-msg action "#redshift.hook.0" & 1> /dev/null
else
	polybar-msg action "#redshift.hook.1" & 1> /dev/null
fi

# Picom
if ! pgrep -x picom > /dev/null;then
	picom --experimental-backend & 1> /dev/null
fi

if ! pgrep -x batsignal > /dev/null;then
	usrbatsignal & 1> /dev/null
fi

# Refresh all poly bar ipc
usrkbdlight & > /dev/null
usrbrightness & > /dev/null
