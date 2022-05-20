#!/usr/bin/bash

# User
USER=$(whoami)

# Changing to user ownership
sudo chown -R $USER:$USER *

# taking care of  nvim 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall
echo "Nvim installation completed"

# Installing wm
sudo pacman -Sy bspwm sxhkd dunst picom alacritty git powerline powerline-fonts unzip lightdm lightdm-gtk-greeter brightnessctl dmenu lxappearance openssh nodesjs npm neovim xclip
echo "Installed wm and other utilities"

# installing yay
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si 
echo "Installed yay"
cd ..

# install some more packages from yay
yay -Sy polybar pulseaudio-ctl redshift-minimal batsignal i3lock-color arc-gtk-theme-git google-chrome picom-jonaburg-git nodejs-live-server

# copying files
mkdir -p ~/.config
cp -rf alacritty/ bspwm/ dunst/ nvim/ picom/ polybar/ powerline-shell/ redshift/ sxhkd/ ~/.config
echo ".config files copied"
cp -r fonts /usr/share
cp -r .bashrc .xprofile .icon/ ~

# Lightdm stuff
sudo cp -r lightdm/* /etc/lightdm
sudo cp -r wallpaper/ /usr/share
echo "lightdm installed"

# Custom scripts
cp -r Scripts/ ~/
sudo ln -P ~/Scripts/* /usr/local/bin

# Final system update
sudo pacman -Syyu
yay -Syyu

# make file system
cd $HOME
mkdir Downloads .cache Code Repos

# refresh bash
bash
