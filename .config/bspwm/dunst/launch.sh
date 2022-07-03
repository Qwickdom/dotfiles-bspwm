#!/bin/bash

dir="$HOME/.config/bspwm/dunst/dunstrc"
killall -9 dunst
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

if  [[ "$1" = "--ganyu" ]]; then
  dunst -config "$dir"/ganyu &
elif  [[ "$1" = "--hsgrl" ]]; then
  dunst -config "$dir"/hsgrl &
elif  [[ "$1" = "--mfuji" ]]; then
  dunst -config "$dir"/mfuji &
else
  echo "No option specified, Available options: --ganyu  --hsgrl  --mfuji"
fi

sleep 2; dunstify -u normal "Hello $USER" "Welcome"
