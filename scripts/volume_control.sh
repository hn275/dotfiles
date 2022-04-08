#!/bin/bash

# Volume control for key binding
# the options are "up", "down", "mute"
# "up" increases the volume by 5
# "down" decreases the volume by 5
# "mute" toggles mute/unmute of the sink

volume_up () {
	$( 
		pulsemixer    \
			--unmute              \
			--change-volume +5    \
			--max-volume 100      \
	)
}

volume_down () {
	$( 
		pulsemixer    \
			--unmute              \
			--change-volume -5    \
	)
}

mute_toggle () {
	$( pulsemixer --toggle-mute )
}

case $1 in
	"mute") mute_toggle;;
	"up") volume_up;;
	"down") volume_down;;
esac

