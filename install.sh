#!/usr/local/bin/bash

echo "Installing dependencies"
sudo pacman -Sy i3-wm libpulse brightnessctl \
    nitrogen keyd make \
    fish zsh alacritty neovim tmux \
    slop shotgun \ # screenshotting dependencies

echo "Coping config files"
cp -r .config/* $HOME/.config/
cp -r .tmux .tmux.conf .Xmodmap $HOME/
echo "Done"

echo "Setting up i3 status"
echo "Done"
