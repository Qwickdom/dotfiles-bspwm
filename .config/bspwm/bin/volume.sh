#!/bin/bash

envFile="$HOME/.config/bspwm/bin"
VOLUME=on
VOLUME_P=35
changeValue=5

# Get Volume
get_volume() {
  volume=`amixer get Master | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`
  echo "$volume"
}

# Decrease Volume
dec_volume() {
  amixer -Mq set Master,0 $changeValue%- unmute && dunstify -u low --replace=69 "Volume: $(get_volume)"
}

# Increase Volume
inc_volume() {
  amixer -Mq set Master,0 $changeValue%+ unmute && dunstify -u low --replace=69 "Volume: $(get_volume)"
}

# Changes
changeMode() {
  sed -i "4s/=$1/=$2/" "$envFile"/volume.sh
  VOLUME=$2
}

changeVol() {
  if [ "$2" -gt -5 ] && [ "$2" -lt 105 ]; then
    sed -i "5s/=$1/=$2/" "$envFile"/volume.sh
  fi
}

# Execute accordingly
if  [[ "$1" = "--get" ]]; then
  get_volume

elif [[ "$1" = "--dec" ]]; then
  if [ "$VOLUME" = off ]; then
    changeMode "$VOLUME" on
  fi
  changeVol $((VOLUME_P)) $((VOLUME_P-changeValue))
  dec_volume

elif [[ "$1" = "--inc" ]]; then
  if [ "$VOLUME" = off ]; then
    changeMode "$VOLUME" on
  fi
  changeVol $((VOLUME_P)) $((VOLUME_P+changeValue))
  inc_volume

elif [[ "$1" = "--togf" ]]; then
  if [ "$VOLUME" = on ]; then
    changeMode "$VOLUME" off
    amixer set Master toggle && dunstify -u low --replace=69 "Mute"
  fi

elif [[ "$1" = "--togn" ]]; then
  if [ "$VOLUME" = off ]; then
    changeMode "$VOLUME" on
    amixer set Master toggle && dunstify -u low --replace=69 "Unmute"
  fi

elif [[ "$1" = "--togg" ]]; then
  if [ "$VOLUME" = on ]; then
    changeMode "$VOLUME" off
    amixer set Master toggle && dunstify -u low --replace=69 "Mute"
  else
    changeMode "$VOLUME" on
    amixer set Master toggle && dunstify -u low --replace=69 "Unmute"
  fi

elif [[ "$1" = "--vol" ]]; then
  case $VOLUME in
    on)
      if [ $VOLUME_P == 0 ]; then
        echo " %{F#A54242} "
      elif (( $VOLUME_P >= 5 )) && (( $VOLUME_P < 75 )); then
        echo "  "
      else
        echo " %{F#ffffff} "
      fi
      ;;
    off)
      echo " %{F#ff0000} "
      ;;
  esac

else
  echo "No option specified, Available options: --get  --dec  --inc  \
  --togf  --togn  --togg  --vol"
fi
