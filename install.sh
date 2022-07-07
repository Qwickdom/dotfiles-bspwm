#!/bin/env bash

clear
echo -e "Hello $USER! \nThis script is to be used after a simple instalation of Arch Linux \n
To use this script your selections are whit numbers\n"

step_1(){
  echo -e "[ Step 1 ] System update\n"
  sudo pacman -Syu
  sleep 3; clear
}

step_2(){
cat << EOF

[ Step 2 ] Git and pacman wrapper

These are the popular:
(1) yay
(2) paru

EOF

  read -p "(?) Select option: " ans_2
  if [[ $ans_2 == "1" ]] || [[ $ans_2 == "yay" ]]; then
    HELPER="yay"
    if ! command -v $HELPER &> /dev/null; then
      sudo pacman -S git --noconfirm
      git clone https://aur.archlinux.org/$HELPER.git /tmp/$HELPER
      (cd /tmp/$HELPER/ && makepkg -si PKGBUILD)
      sleep 3; clear
    else
      echo -e "\n(*) It seems that you already have $HELPER installed, skipping..."
      sleep 3; clear
    fi
    
  elif [[ $ans_2 == "2" ]] || [[ $ans_2 == "paru" ]]; then
    HELPER="paru"
    if ! command -v $HELPER &> /dev/null; then
      sudo pacman -S git --noconfirm
      git clone https://aur.archlinux.org/$HELPER.git /tmp/$HELPER
      (cd /tmp/$HELPER/ && makepkg -si PKGBUILD)
      sleep 3; clear
    else
      echo -e "\n(*) It seems that you already have $HELPER installed, skipping..."
      sleep 3; clear
    fi
  else
    echo -e "\n(!) Invalid option, select one to continue"
    sleep 3; clear
  fi
}

step_3.1(){
cat << EOF

[ Step 3 ] Dependencies

[ 3.1 ]
Do you want to install xorg packages?
(1) yes
(2) no

EOF

  read -p "(?) Select option: " ans_3_1
  if [[ $ans_3_1 == "1" ]] || [[ $ans_3_1 == "yes" ]]; then
    sudo pacman -S xorg-server xorg-xinit xorg-xbacklight xorg-xsetroot xorg-xset xorg-xprop xorg-setxkbmap
    sleep 3; clear
  elif [[ $ans_3_1 == "2" ]] || [[ $ans_3_1 == "no" ]]; then
    echo -e "\n(*) Skipping..."
    sleep 3; clear
  else
    echo -e "\n(!) Invalid option, select one to continue"
    sleep 3; clear
  fi
}

step_3.2(){
cat <<- EOF

[ 3.2 ]
Do you want to install video driver?
(1) yes
(2) no

EOF

  read -p "[?] Select option: " ans_3_2
  if [[ $ans_3_2 == "1" ]] || [[ $ans_3_2 == "yes" ]]; then
    echo "(1) xf86-video-intel   (2) xf86-video-amdgpu   (3) nvidia"
    read -r -p "Choose your video card driver (default 1): " vid
    case $vid in 
      [1])
        DRI='xf86-video-intel'
        ;;
      [2])
        DRI='xf86-video-amdgpu'
        ;;
      [3])
        DRI='nvidia nvidia-settings nvidia-utils'
        ;;
      [*])
        DRI='xf86-video-intel'
        ;;
    esac
    sudo pacman -S $DRI
    sleep 3; clear
  elif [[ $ans_3_2 == "2" ]] || [[ $ans_3_2 == "no" ]]; then
    echo -e "\n[*] Skipping..."
    sleep 3; clear
  else
    echo -e "\n[!] Invalid option, select one to continue"
    sleep 3; clear
  fi
}

step_3.3(){
cat << EOF

[ 3.3 ]
Do you want to install audio packages?
(1) yes
(2) no

EOF

  read -p "(?) Select option: " ans_3_3
  if [[ $ans_3_3 == "1" ]] || [[ $ans_3_3 == "yes" ]]; then
    echo "(1) pipewire whit wireplumber   (2) pulseaudio"
    read -r -p "(default 1): " aud
    case $aud in 
      [1])
        dri='pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber alsa-lib alsa-utils'
        ;;
      [2])
        dri='pulseaudio pulseaudio-alsa pulseaudio-jack alsa-lib alsa-utils'
        ;;
      [*])
        dri='pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber alsa-lib alsa-utils'
        ;;
    esac
    sudo pacman -S $dri
    sleep 3; clear
  elif [[ $ans_3_3 == "2" ]] || [[ $ans_3_3 == "no" ]]; then
    echo -e "\n(*) Skipping..."
    sleep 3; clear
  else
    echo -e "\n(!) Invalid option, select one to continue"
    sleep 3; clear
  fi
}

step_3.4(){
cat << EOF

[ 3.4 ]
Do you want to install noto fonts?
(1) yes
(2) no

EOF

  read -p "(?) Select option: " ans_3_4
  if [[ $ans_3_4 == "1" ]] || [[ $ans_3_4 == "yes" ]]; then
    sudo pacman -S noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk
    sleep 3; clear
  elif [[ $ans_3_4 == "2" ]] || [[ $ans_3_4 == "no" ]]; then
    echo -e "\n(*) Skipping..."
    sleep 3; clear
  else
    echo -e "\n(!) Invalid option, select one to continue"
    sleep 3; clear
  fi
}

step_3.5(){
cat << EOF

[ 3.5 ]
Do you want to install essentials packages?
(1) yes
(2) no

EOF

  read -p "(?) Select option: " ans_3_5
  if [[ $ans_3_5 == "1" ]] || [[ $ans_3_5 == "yes" ]]; then
    $HELPER -Sy alacritty chromium ranger polybar rofi picom feh betterlockscreen scrot polkit-gnome ueberzug bspwm sxhkd
    sleep 3; clear
  elif [[ $ans_3_5 == "2" ]] || [[ $ans_3_5 == "no" ]]; then
    echo -e "\nYou really need the essentials packages for dotfiles to work"
    echo "Do you want to skip for now?"
    echo "(1) yes   (2) no"
    read -r -p "Think wisely (default 2): " ess
    case $ess in 
      [1])
        PKG="(*) Skipping..."
        ;;
      [2])
        PKG='alacritty chromium ranger polybar rofi picom feh betterlockscreen scrot polkit-gnome ueberzug bspwm sxhkd'
        ;;
      [*])
        PKG='alacritty chromium ranger polybar rofi picom feh betterlockscreen scrot polkit-gnome ueberzug bspwm sxhkd'
        ;;
    esac
    if [ $ess -eq 1 ]; then
      echo -e "\n$PKG"
      sleep 3; clear
    else
      $HELPER -S $PKG
      sleep 3; clear
    fi
  else
    echo -e "\n(!) Invalid option, select one to continue"
    sleep 3; clear
  fi
}

step_3.6(){
cat << EOF

[ 3.6 ]
Do you want to install optionals packages?
(1) yes
(2) no

EOF

  read -p "(?) Select option: " ans_3_6
  if [[ $ans_3_6 == "1" ]] || [[ $ans_3_6 == "yes" ]]; then
    $HELPER -S htop neofetch pcmanfm-gtk3 gimp tree python python-pip tk lxappearance-gtk3 \
    gvfs gvfs-mtp mpd mpc ncmpcpp bluez bluez-libs bluez-utils clipster qrencode fuse2 \
    pavucontrol arandr dunst libnotify xclip viewnior man-db redshift
    sleep 3; clear
  elif [[ $ans_3_6 == "2" ]] || [[ $ans_3_6 == "no" ]]; then
    echo -e "\nSome of this packages are necessary but you can choose if you want to use them"
    echo "So... Install optionals packages?"
    echo "(1) yes   (2) no"
    read -r -p "(default 1): " opt
    case $opt in 
      [1])
        pkg='htop neofetch pcmanfm-gtk3 gimp tree python python-pip tk lxappearance-gtk3 \
          gvfs gvfs-mtp mpd mpc ncmpcpp bluez bluez-libs bluez-utils clipster qrencode fuse2 \
          pavucontrol arandr dunst libnotify xclip viewnior man-db redshift'
        ;;
      [2])
        pkg='(*) Skipping...'
        ;;
      [*])
        pkg='htop neofetch pcmanfm-gtk3 gimp tree python python-pip tk lxappearance-gtk3 \
          gvfs gvfs-mtp mpd mpc ncmpcpp bluez bluez-libs bluez-utils clipster qrencode fuse2 \
          pavucontrol arandr dunst libnotify xclip viewnior man-db redshift'
        ;;
    esac
    if [ $opt -eq 1 ]; then
      $HELPER -S $pkg
      sleep 3; clear
    else
      echo -e "\n$pkg"
      sleep 3; clear
    fi
  else
    echo -e "\n(!) Invalid option, select one to continue"
    sleep 3; clear
  fi
}

step_4.1(){
cat << EOF

[ Step 4 ] Configurations files

[ 4.1 ]
Cloning the repository...

EOF

  git clone --recurse-submodules https://github.com/Qwickdom/dotfiles-bspwm.git /tmp/dotfiles-bspwm
  cd /tmp/dotfiles-bspwm && git submodule update --remote --recursive
  echo -e "\nDotfiles are ready to be copied"
  sleep 3; clear
}

step_4.2(){
cat << EOF

[ 4.2 ]
Again, this script is to be used after a simple instalation of Arch Linux
Therefore, if you already have your operating system, it would be better to create a backup
Do you want to create a backup?
(1) yes
(2) no

EOF

  read -p "(?) Select option: " ans_4_2
  if [[ $ans_4_2 == "1" ]] || [[ $ans_4_2 == "yes" ]]; then
    mkdir ~/.BackUp
    cp -rf .config .fonts .mpd .ncmpcpp .themes .icons .vim .fehbg .gtkrc-2.0 .vimrc .xinitrc ~/.BackUp
    echo -e "\nYour directories now are in to the folder .BackUp"
    echo -e "Now, I'll proceed to copy the dotfiles"
    cp -rf .config .fonts .mpd .ncmpcpp .themes .icons .vim .fehbg .gtkrc-2.0 .vimrc .xinitrc ~/
    sleep 3; clear
    echo -e "If you use a laptop you need to copy this file to be able to click on tap"
    echo "Do you want to copy?"
    echo "(1) yes   (2) no"
    read -r -p "(default 1): " tcp
    case $tcp in 
      [1])
        ttc='sudo cp 02-touchpad-ttc.conf /etc/X11/xorg.conf.d/'
        ;;
      [2])
        ttc='(*) Skipping...'
        ;;
      [*])
        ttc='sudo cp 02-touchpad-ttc.conf /etc/X11/xorg.conf.d/'
        ;;
    esac
    if [ $tcp -eq 1 ]; then
      $ttc
      sleep 3; clear
    else
      echo -e "\n$ttc"
      sleep 3; clear
    fi
  
  elif [[ $ans_4_2 == "2" ]] || [[ $ans_4_2 == "no" ]]; then
    echo -e "\nOkay... I'm assuming you know what you're doing"
    echo "Copy dotfiles?"
    echo "(1) yes   (2) no"
    read -r -p "(default 1): " cp
    case $cp in
      [1])
        dot='cp -rf .config .fonts .mpd .ncmpcpp .themes .icons .vim .fehbg .gtkrc-2.0 .vimrc .xinitrc ~/'
        ;;
      [2])
        dot='(*) Skipping... Why you use this script?'
        ;;
      [*])
        dot='cp -rf .config .fonts .mpd .ncmpcpp .themes .icons .vim .fehbg .gtkrc-2.0 .vimrc .xinitrc ~/'
        ;;
    esac
    if [ $cp -eq 1 ]; then
      echo -e "\nNow, I'll proceed to copy the dotfiles"
      $dot
      sleep 3; clear
      echo -e "If you use a laptop you need to copy this file to be able to click on tap"
      echo "Do you want to copy?"
      echo "(1) yes   (2) no"
      read -r -p "(default 1): " touch
      case $touch in
        [1])
          pad='sudo cp 02-touchpad-ttc.conf /etc/X11/xorg.conf.d/'
          ;;
        [2])
          pad='(*) Skipping...'
          ;;
        [*])
          pad='sudo cp 02-touchpad-ttc.conf /etc/X11/xorg.conf.d/'
          ;;
      esac
      if [ $touch -eq 1 ]; then
        $pad
        sleep 3; clear
      else
        echo -e "\n$pad"
        sleep 3; clear
      fi

    else
      echo -e "\n$dot"
      sleep 3; clear
      echo "EASY COME, EASY GO..."
      sleep 3; clear
    fi

  else
    echo -e "\n(!) Invalid option, select one to continue"
    sleep 3; clear
  fi
}

step_4.3(){
cat << EOF

[ 4.3 ]
Make some binaries executable
And detection of new fonts

EOF

  cd ~
  chmod +x .config/bspwm/bin/*
  chmod +x .config/bspwm/rofi/bin/*
  fc-cache -fv
  echo -e "\nAlright, it seems that everything is ready"
  sleep 3; clear
  echo -e "Thank you for using this script, I hope it has been useful to you"
  echo "Reboot the system?"
  echo "(1) yes   (2) no"
  read -r -p "(default 1): " rbt
  case $rbt in 
    [1])
      sys='reboot'
      ;;
    [2])
      sys='(*) Skipping... Really, why?'
      ;;
    [*])
      sys='reboot'
      ;;
  esac
  if [ $rbt -eq 1 ]; then
    sleep 3; clear
    echo "Remember use startx command to enter BSPWM if you don't have display manager"
    sleep 3; clear
    echo "SEE YOU SPACE COWBOY..."
    systemctl $sys
  else
    echo -e "\n$sys"
    sleep 3; clear
    echo -e "ARE YOU LIVING IN THE \nREAL WORLD?"
    sleep 3; clear
  fi
}

sleep 3;
step_1

while [[ $ans_2 != "1" ]] && [[ $ans_2 != "2" ]] && [[ $ans_2 != "yay" ]] && [[ $ans_2 != "paru" ]]; do
  step_2
done

while [[ $ans_3_1 != "1" ]] && [[ $ans_3_1 != "2" ]] && [[ $ans_3_1 != "yes" ]] && [[ $ans_3_1 != "no" ]]; do
  step_3.1
done

while [[ $ans_3_2 != "1" ]] && [[ $ans_3_2 != "2" ]] && [[ $ans_3_2 != "yes" ]] && [[ $ans_3_2 != "no" ]]; do
  step_3.2
done

while [[ $ans_3_3 != "1" ]] && [[ $ans_3_3 != "2" ]] && [[ $ans_3_3 != "yes" ]] && [[ $ans_3_3 != "no" ]]; do
  step_3.3
done

while [[ $ans_3_4 != "1" ]] && [[ $ans_3_4 != "2" ]] && [[ $ans_3_4 != "yes" ]] && [[ $ans_3_4 != "no" ]]; do
  step_3.4
done

while [[ $ans_3_5 != "1" ]] && [[ $ans_3_5 != "2" ]] && [[ $ans_3_5 != "yes" ]] && [[ $ans_3_5 != "no" ]]; do
  step_3.5
done

while [[ $ans_3_6 != "1" ]] && [[ $ans_3_6 != "2" ]] && [[ $ans_3_6 != "yes" ]] && [[ $ans_3_6 != "no" ]]; do
  step_3.6
done

step_4.1

while [[ $ans_4_2 != "1" ]] && [[ $ans_4_2 != "2" ]] && [[ $ans_4_2 != "yes" ]] && [[ $ans_4_2 != "no" ]]; do
  step_4.2
done

if [[ $ans_4_2 == "1" ]] || [[ $ans_4_2 == "yes" ]]; then
  step_4.3
fi

if [ $cp -eq 1 ]; then
  step_4.3
fi
