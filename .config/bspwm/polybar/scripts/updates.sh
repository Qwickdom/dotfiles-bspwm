#!/bin/sh

DIRG="$HOME/.config/bspwm/polybar/ganyu/config"
DIRH="$HOME/.config/bspwm/polybar/hsgrl/config"
DIRM="$HOME/.config/bspwm/polybar/mfuji/config"
STATUS="$(nmcli radio wifi)"

if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
  if [[ $STATUS == *"enable"* ]]; then
    if ! updates_arch=$(pacman -Qu | wc -l); then
      updates_arch=0
    fi

    if ! updates_yay=$(yay -Qu --aur --quiet | wc -l); then
      updates_yay=0
    fi

    updates=$(("$updates_arch" + "$updates_yay"))

    if [ "$updates" -gt 0 ]; then
      echo "%{F#ffffff}󰮯󰊠>$updates "
      dunstify -u low --replace=69 "New updates available"
    else
      if [[ "$1" == *"--ganyu"* ]]; then
        sed -i "14s/white/black/" "$DIRG"/modules.ini
        echo "󰮯󰊠>0 "
      elif [[ "$1" == *"--hsgrl"* ]]; then
        sed -i "14s/white/black/" "$DIRH"/modules.ini
        echo "󰮯󰊠>0 "
      elif  [[ "$1" = "--mfuji" ]]; then
        sed -i "14s/white/grey/" "$DIRM"/modules.ini
        echo "󰮯󰊠>0 "
      else
        echo "󰮯󰊠>0 "
      fi
    fi
  fi
fi

if [[ $STATUS == *"disabled"* ]]; then
  if [[ "$1" == *"--ganyu"* ]]; then
    sed -i "14s/white/black/" "$DIRG"/modules.ini
    echo "󰮯󰊠>Game Over "
  elif [[ "$1" == *"--hsgrl"* ]]; then
    sed -i "14s/white/black/" "$DIRH"/modules.ini
    echo "󰮯󰊠>Game Over "
  elif  [[ "$1" = "--mfuji" ]]; then
    sed -i "14s/white/grey/" "$DIRM"/modules.ini
    echo "󰮯󰊠>Game Over "
  else
    echo "󰮯󰊠>Game Over "
  fi
fi
