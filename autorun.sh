#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run picom
run setxkbmap -option "grp:shifts_toggle,compose:sclk" "us,us(intl)"
