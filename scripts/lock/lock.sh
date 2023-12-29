#!/usr/bin/env bash

# https://github.com/Arkq/alock
# alock \
    #-cursor blank \
    #-input frame:input=white,error=red,check=green \
    #-bg blank:color="#1e1e1e"

wrong_color="ef4444ff"
verif_color="0ea5e9ff"
dark_bg="00000070"

i3lock --blur=sigma \
    --ignore-empty-password \
    --clock \
    --radius=120 \
    --time-color=ffffffff \
    --time-str="%H:%M:%S" \
    --date-color=ffffffff \
    --date-str="%A, %m %d %Y" \
    --indicator \
    --ring-width=2 \
    --ring-color=ffffff86 \
    --line-color=ffffff30 \
    --separator-color=ffffffff \
    --bshl-color=fde047ff \
    --keyhl-color=ffffffff \
    --inside-color=${dark_bg} \
    --ringver-color=${verif_color} \
    --insidever-color=${dark_bg} \
    --verif-color=${verif_color} \
    --verif-text="authenticating" \
    --ringwrong-color=${wrong_color} \
    --insidewrong-color=${dark_bg} \
    --wrong-color=${wrong_color} \
    --wrong-text="bruh" \
    --noinput-text="no input" \
