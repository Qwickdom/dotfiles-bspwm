#!/bin/bash

killall -9 dunst
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done
dunst -config ~/.config/bspwm/dunst/dunstrc &

dunstify -u normal "Hello $USER" "Welcome"
