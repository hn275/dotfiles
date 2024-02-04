#!/usr/local/bin/bash

#echo "Installing dependencies"
#sudo pacman -Sy i3-wm libpulse brightnessctl \
    #    nitrogen keyd make \
    #    fish zsh alacritty neovim tmux \
    #    slop shotgun \ # screenshotting dependencies
#
#echo "Coping config files"
#cp -r .config/* $HOME/.config/
#cp -r .tmux .tmux.conf .Xmodmap $HOME/
#echo "Done"
#
#echo "Setting up i3 status"
#echo "Done"
#
#echo "setting up environments"

mkdir -p "$XDG_CONFIG_HOME/redshift/"
ln -P ./.config/redshift/redshift.conf $XDG_CONFIG_HOME/redshift/redshift.conf

ln -P ./.zshrc $HOME/.zshrc

# NOTE: keyd is the deamon for remapping the some of the keyboards
# for laptop since the keyboard can't be flashed (i don't know how to)
# TODO: update it
# sudo mkdir -p /etc/keyd
# sudo ln -P ./etc/keyd/default.conf /etc/keyd/default.conf
