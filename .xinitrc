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

# xmodmap, customize bindking keys, since XF86Audio keys arent registered
#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# Start pulseaudioservice
#systemctl --user start pulseaudio.service

# Cursor theme
xsetroot -cursor_name left_ptr & 

# Start nitrogen
nitrogen --restore & 

# Picom
picom --experimental-backends &

# Dimmed display and light up kbd
$HOME/.config/scripts/startups/dim_light/dimmed.sh

# Redshift
redshift -c $HOME/.config/redshift/redshift.conf &

# Polybar
$HOME/.config/scripts/polybar_launcher.sh 

# BSPWM
exec bspwm
