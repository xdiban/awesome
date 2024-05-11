#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

#volumeicon
run volctl

#Compositor
run picom

#Layouts
run setxkbmap -layout "us,us(intl)"

#Authentication agent
run lxsession

#Redshift + Location
run /usr/lib/geoclue-2.0/demos/agent
run redshift-gtk

#Flameshot
run flameshot

#Power management
run xfce4-power-management

#Network manager applet
run nm-applet

#Bluetooth applet
run blueman-applet

#Nvidia Config
nvidia-settings --load-config-only
