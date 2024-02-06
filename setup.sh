#!/bin/bash

#Update keyring
sudo pacman -Sy archlinux-keyring

#Update system
yay -Syu

#Install dependencies
yay -S volctl picom lxsession redshift flameshot kitty nvim firefox i3lock xtrlock pcmanfm xfce4-power-manager network-manager-applet xorg-server xorg-xinit materia-gtk-theme capitaine-cursors lxapparence-gtk3 papirus-icon-theme blueman

#Systemctl services
sudo systemctl enable --now geoclue.service
sudo systemctl enable --now bluetooth.service

#Picom config
mkdir ~/.config/picom
ln -s ~/.config/awesome/conf/picom.conf ~/.config/picom/picom.config 
