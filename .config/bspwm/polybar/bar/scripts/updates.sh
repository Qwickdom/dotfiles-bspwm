#!/bin/sh

if ! updates_arch=$(pacman -Qu | wc -l); then
    updates_arch=0
fi

if ! updates_yay=$(yay -Qu --aur --quiet | wc -l); then
    updates_yay=0
fi

updates=$(("$updates_arch" + "$updates_yay"))

if [ "$updates" -gt 0 ]; then
    echo "$updates"
else
    echo "0"
fi
