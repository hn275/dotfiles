#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Fixing issues for github and vscode



# Set cursor
xsetroot -cursor_name left_ptr &

# Screen layout
$HOME/.screenlayout/display.sh > /dev/null

# Pulse audio
systemctl --user start pulseaudio.service &

# Picom
picom --experimental-backends & > /dev/null

# Polybar
sleep 1 && $HOME/.config/scripts/polybar_launcher.sh & > /dev/null

# Nitrogen
nitrogen --restore &

# Set Resouces 
xrdb ~/.Xresources &

# BSPWM
exec bspwm
