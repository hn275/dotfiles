#!/usr/bin/env bash


# Otherwise you can use the nuclear option:

if pgrep -x polybar > /dev/null;then
	killall -q polybar
fi

polybar top &
#polybar bottomright &
#polybar bottomcenter &
