#!/usr/bin/bash

# Customize i3lock for lock screen
# Background is simply blurred

BACKGROUND=0D182680
FOREGROUND=b3F2C4b3
PRIMARY=517C8C
ALERT=D9843B
FONT="JetBrains Mono"


i3lock \
	--blur=sigma                       \
	--ignore-empty-password            \
	--clock                            \
	--indicator                        \
	--line-uses-inside                 \
	\
	--keyhl-color=$FOREGROUND          \
	--bshl-color=$ALERT                \
	--separator-color=00000000         \
	\
	--ring-width=3                     \
	--inside-color=$BACKGROUND         \
	--ring-color=$PRIMARY              \
	\
	--verif-color=$PRIMARY             \
	--ringver-color=$PRIMARY           \
	--insidever-color=$BACKGROUND      \
	--verif-text="Authenticating.."    \
	--verif-size=17                    \
	--verif-font="$FONT"               \
	\
	--wrong-color=$ALERT               \
	--ringwrong-color=$ALERT           \
	--insidewrong-color=$BACKGROUND    \
	--wrong-text="Try again"           \
	--wrong-font="$FONT"               \
	--wrong-size=20                    \
	--noinput-text="Empty string"      \
	\
	--time-font="$FONT"                \
	--time-size=25                     \
	--time-str="%H:%M:%S"              \
	--time-color=$PRIMARY              \
	\
	--date-size=15                     \
	--date-font="$FONT"                \
	--date-color=$PRIMARY
