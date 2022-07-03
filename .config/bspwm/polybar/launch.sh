#!/usr/bin/env bash

dir="$HOME/.config/bspwm/polybar"
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if  [[ "$1" = "--ganyu" ]]; then
  polybar -q main -c "$dir"/ganyu/config.ini &
elif  [[ "$1" = "--hsgrl" ]]; then
  polybar -q main -c "$dir"/hsgrl/config.ini &
elif  [[ "$1" = "--mfuji" ]]; then
  polybar -q main -c "$dir"/mfuji/config.ini &
else
  echo "No option specified, Available options: --ganyu  --hsgrl  --mfuji"
fi
