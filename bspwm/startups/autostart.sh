#!/usr/bin/bash

# Polybar
usrpolybar

# Nightshift?
if pgrep -x redshift > /dev/null;then
	        polybar-msg action "#redshift.hook.0"
	else
	        polybar-msg action "#redshift.hook.1"
fi

# Picom
if ! pgrep -x picom > /dev/null;then
	picom --experimental-backend &
fi

if ! pgrep -x batsignal > /dev/null;then
	usrbatsignal &
fi
