#!/bin/sh

IFACE="$(nmcli | grep -i interface | awk '/interface/ {print $2}')"
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
            echo "$updates "
        else
            echo "0 "
        fi
    fi
fi

if [[ $STATUS == *"disabled"* ]]; then
    echo "Disconnected "
fi