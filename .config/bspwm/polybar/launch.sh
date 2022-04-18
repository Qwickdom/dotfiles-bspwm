#! /bin/sh
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar bar -c $HOME/.config/bspwm/polybar/config &
polybar bar2 -c $HOME/.config/bspwm/polybar/config &
