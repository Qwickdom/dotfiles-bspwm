#!/usr/bin/env bash

dir="$HOME/.config/bspwm/polybar"
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -q main -c "$dir"/config.ini &
