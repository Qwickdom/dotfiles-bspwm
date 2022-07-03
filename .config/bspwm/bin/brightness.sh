#!/usr/bin/env bash

# Graphics card
CARD=`ls /sys/class/backlight | head -n 1`

# Brightness
BRIGHTNESS=20
changePorcent=5

# Redshift
envFile="$HOME/.config/bspwm/bin"
REDSHIFT=off
REDSHIFT_TEMP=2500
changeValue=500

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

# Decrease brightness
dec_backlight() {
  if [[ "$CARD" == *"intel_"* ]]; then
    xbacklight -dec $changePorcent && dunstify -u low --replace=69 "Brightness: $(get_backlight)"
  else
    light -U $changePorcent && dunstify -u low --replace=69 "Brightness: $(get_backlight)"
  fi
}

# Increase brightness
inc_backlight() {
  if [[ "$CARD" == *"intel_"* ]]; then
    xbacklight -inc $changePorcent && dunstify -u low --replace=69 "Brightness: $(get_backlight)"
  else
    light -A $changePorcent && dunstify -u low --replace=69 "Brightness: $(get_backlight)"
  fi
}

# Temperature 
changeMode() {
  sed -i "12s/=$1/=$2/g" "$envFile"/brightness.sh
  REDSHIFT=$2
  echo $REDSHIFT
}

changeBrightness() {
  if [ "$2" -gt -5 ] && [ "$2" -lt 105 ]; then
    sed -i "7s/=$1/=$2/" "$envFile"/brightness.sh
  fi
}

changeTemp() {
  if [ "$2" -gt 500 ] && [ "$2" -lt 25500 ]; then
    sed -i "13s/=$1/=$2/g" "$envFile"/brightness.sh 
    redshift -P -O $((REDSHIFT_TEMP+changeValue))
  fi
}

# Execute accordingly
case $1 in
  "--get")
    get_backlight
    ;;
  "--dec")
    changeBrightness $((BRIGHTNESS)) $((BRIGHTNESS-changePorcent))
    dec_backlight
    ;;
  "--inc")
    changeBrightness $((BRIGHTNESS)) $((BRIGHTNESS+changePorcent))
    inc_backlight
    ;;
  "--togf") 
    if [ "$REDSHIFT" = on ]; then
      changeMode "$REDSHIFT" off
      redshift -x && dunstify -u low --replace=69 "Night light: off"
    fi
    ;;
  "--togn") 
    if [ "$REDSHIFT" = off ]; then
      changeMode "$REDSHIFT" on
      redshift -O "$REDSHIFT_TEMP" && dunstify -u low --replace=69 "Night light: on"
    fi
    ;;
  "--togg") 
    if [ "$REDSHIFT" = on ]; then
      changeMode "$REDSHIFT" off
      redshift -x && dunstify -u low --replace=69 "Night light: off"
    else
      changeMode "$REDSHIFT" on
      redshift -O "$REDSHIFT_TEMP" && dunstify -u low --replace=69 "Night light: on"
    fi
    ;;
  "--decr")
    if [ "$REDSHIFT" = off ]; then
      changeMode "$REDSHIFT" on
    fi
    changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP-changeValue))
    dunstify -u low --replace=69 "Temperature: $((REDSHIFT_TEMP-changeValue))"
    ;;
  "--incr")
    if [ "$REDSHIFT" = off ]; then
      changeMode "$REDSHIFT" on
    fi
    changeTemp $((REDSHIFT_TEMP)) $((REDSHIFT_TEMP+changeValue))
    dunstify -u low --replace=69 "Temperature: $((REDSHIFT_TEMP+changeValue))"
    ;;
  "--temp")
    case $REDSHIFT in
      on)
        if (( $REDSHIFT_TEMP <= 3000 )); then
          echo " %{F#Face02} "
        elif (( $REDSHIFT_TEMP >= 3500 )) && (( $REDSHIFT_TEMP <= 5500 )); then
          echo " %{F#Face02} "
        elif [ $REDSHIFT_TEMP == 6000 ]; then
          echo " %{F#Face02} "
        elif (( $REDSHIFT_TEMP >= 6500 )) && (( $REDSHIFT_TEMP <= 8500 )); then
          echo " %{F#Face02} "
        elif [ $REDSHIFT_TEMP == 9000 ]; then
          echo " %{F#Face02} "
        elif (( $REDSHIFT_TEMP >= 9500 )) && (( $REDSHIFT_TEMP <= 11500 )); then
          echo " %{F#Face02} "
        elif [ $REDSHIFT_TEMP == 12000 ]; then
          echo " %{F#Face02} "
        elif (( $REDSHIFT_TEMP >= 12500 )) && (( $REDSHIFT_TEMP <= 14500 )); then
          echo " %{F#3da7f4} "
        elif [ $REDSHIFT_TEMP == 15000 ]; then
          echo " %{F#3da7f4} "
        elif (( $REDSHIFT_TEMP >= 15500 )) && (( $REDSHIFT_TEMP <= 17500 )); then
          echo " %{F#3da7f4} "
        elif [ $REDSHIFT_TEMP == 18000 ]; then
          echo " %{F#3da7f4} "
        elif (( $REDSHIFT_TEMP >= 18500 )) && (( $REDSHIFT_TEMP <= 20500 )); then
          echo " %{F#3da7f4} "
        elif [ $REDSHIFT_TEMP == 21000 ]; then
          echo " %{F#3da7f4} "
        elif (( $REDSHIFT_TEMP >= 21500 )) && (( $REDSHIFT_TEMP <= 23500 )); then
          echo " %{F#3da7f4} "
        elif [ $REDSHIFT_TEMP == 24000 ]; then
          echo " %{F#3da7f4} "
        else
          echo " %{F#3da7f4} "
        fi
        ;;
      off)
        if (( $BRIGHTNESS <= 5 )); then
          echo "  "
        elif [ $BRIGHTNESS == 10 ]; then
          echo "  "
        elif [ $BRIGHTNESS == 15 ]; then
          echo "  "
        elif (( $BRIGHTNESS >= 20 )) && (( $BRIGHTNESS <= 25 )); then
          echo "  "
        elif [ $BRIGHTNESS == 30 ]; then
          echo "  "
        elif [ $BRIGHTNESS == 35 ]; then
          echo "  "
        elif (( $BRIGHTNESS >= 40 )) && (( $BRIGHTNESS <= 45 )); then
          echo "  "
        elif [ $BRIGHTNESS == 50 ]; then
          echo "  "
        elif [ $BRIGHTNESS == 55 ]; then
          echo " %{F#ffffff} "
        elif (( $BRIGHTNESS >= 60 )) && (( $BRIGHTNESS <= 65 )); then
          echo " %{F#ffffff} "
        elif [ $BRIGHTNESS == 70 ]; then
          echo " %{F#ffffff} "
        elif [ $BRIGHTNESS == 75 ]; then
          echo " %{F#ffffff} "
        elif (( $BRIGHTNESS >= 80 )) && (( $BRIGHTNESS <= 85 )); then
          echo " %{F#ffffff} "
        elif [ $BRIGHTNESS == 90 ]; then
          echo " %{F#ffffff} "
        elif [ $BRIGHTNESS == 95 ]; then
          echo " %{F#ffffff} "
        else
          echo " %{F#ffffff} "
        fi
        ;;
    esac
    ;;
esac
