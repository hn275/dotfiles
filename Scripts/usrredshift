#! /usr/bin/bash

# Toggling redshift and hook with polybar [module/redshift}

if pgrep -x redshift > /dev/null;then
	#polybar-msg action "#redshift.hook.1"
	polybar-msg action "#brightness.hook.0"
	killall redshift
else
	#polybar-msg action "#redshift.hook.0"
	polybar-msg action "#brightness.hook.1"
	redshift &
fi
