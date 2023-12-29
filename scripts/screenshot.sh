#!/usr/bin/env bash

sel=$(slop -f "-i %i -g %g")

name=$1
[[ -z $name ]] && name="screenshot"
shotgun $sel "$HOME/Pictures/screenshots/$name.png"
