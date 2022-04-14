#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
#polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar1 and bar2
polybar main_topleft &
polybar main_topcenter &
polybar main_topright &
polybar side_topcenter &
polybar side_bottomleft &
