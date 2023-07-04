#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

# Layout
run setxkbmap -layout us,us -variant ,intl -option grp:alt_shift_toggle

# Programs
run qpwgraph -m
