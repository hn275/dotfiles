#! /usr/bin/bash

if pgrep -x "spotify" > /dev/null
then
	wmctrl -a spotify
else
	spotify
fi
