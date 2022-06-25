#!/usr/bin/env bash

# Graphics card
CARD=`ls /sys/class/backlight | head -n 1`

# Get brightness
get_backlight() {
  if [[ "$CARD" == *"intel_"* ]]; then
    BNESS=`xbacklight -get`
    LIGHT=${BNESS%.*}
  else
    LIGHT=$(printf "%.0f\n" `light -G`)
  fi
  echo "${LIGHT}%"
}

# Increase brightness
inc_backlight() {
  if [[ "$CARD" == *"intel_"* ]]; then
    xbacklight -inc 5 && dunstify -u low --replace=69 "Brightness: $(get_backlight)"
  else
    light -A 5 && dunstify -u low --replace=69 "Brightness: $(get_backlight)"
  fi
}

# Decrease brightness
dec_backlight() {
  if [[ "$CARD" == *"intel_"* ]]; then
    xbacklight -dec 5 && dunstify -u low --replace=69 "Brightness: $(get_backlight)"
  else
    light -U 5 && dunstify -u low --replace=69 "Brightness: $(get_backlight)"
  fi
}

# Temperature 
temperature_on(){
  redshift -P -O 2500 && dunstify -u low --replace=69 "Night light: on"
}

temperature_off(){
  redshift -x && dunstify -u low --replace=69 "Night light: off"
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
  get_backlight
elif [[ "$1" == "--inc" ]]; then
  inc_backlight
elif [[ "$1" == "--dec" ]]; then
  dec_backlight
elif [[ "$1" == "--on" ]]; then
  temperature_on
elif [[ "$1" == "--off" ]]; then
  temperature_off
else
  get_backlight
fi
