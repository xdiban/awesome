#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

#Compositor
run picom

#Layouts
run setxkbmap -option "grp:shifts_toggle,compose:sclk" "us,us(intl)"

#Authentication agent
run lxsession

#Redshift + Location
run /usr/lib/geoclue-2.0/demos/agent
run redshift-gtk

