#!/bin/bash

# Get Volume
get_volume() {
  volume=`amixer get Master | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`
  echo "$volume"
}

# Increase Volume
inc_volume() {
  amixer -Mq set Master,0 5%+ unmute && dunstify -u low --replace=69 "Volume: $(get_volume)"
}

# Decrease Volume
dec_volume() {
  amixer -Mq set Master,0 5%- unmute && dunstify -u low --replace=69 "Volume: $(get_volume)"
}

# Toggle Mute
toggle_mute() {
  status=`amixer get Master | tail -n1 | grep -wo 'on'`
  if [[ "$status" == "on" ]]; then
    amixer set Master toggle && dunstify -u low --replace=69 "Mute"
  else
    amixer set Master toggle && dunstify -u low --replace=69 "Unmute"
  fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
  get_volume
elif [[ "$1" == "--inc" ]]; then
  inc_volume
elif [[ "$1" == "--dec" ]]; then
  dec_volume
elif [[ "$1" == "--toggle" ]]; then
  toggle_mute
else
  get_volume
fi
