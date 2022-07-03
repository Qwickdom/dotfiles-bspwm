#!/usr/bin/env bash

DIR="$HOME"
DIRA="$HOME/.config/alacritty"
DIRR="$HOME/.config/bspwm/rofi/themes"
DIRG="$HOME/.config/gtk-3.0"
DIRI="$HOME/.icons/default"
DIRW="$HOME/.config/bspwm/wallpapers"

change_alacritty() {
  cat "$DIRA"/colors/$trm.yml > "$DIRA"/colors.yml
}

change_bar() {
  $HOME/.config/bspwm/polybar/launch.sh "--$bar"
}

change_dunst() {
  $HOME/.config/bspwm/dunst/launch.sh "--$bar"
}

change_feh() {
  feh --bg-fill "$DIRW"/"$bg"
}

change_gtk() {
  sed -i "5s/=.*/=$gtk2/" "$DIR"/.gtkrc-2.0
  sed -i "6s/=.*/=$gtk2_icon/" "$DIR"/.gtkrc-2.0
  sed -i "8s/=.*/=$gtk2_icon_c/" "$DIR"/.gtkrc-2.0
  sed -i "5s/=.*/=$gtk3_icon_c/" "$DIRI"/index.theme
  sed -i "2s/=.*/=$gtk3/" "$DIRG"/settings.ini
  sed -i "3s/=.*/=$gtk3_icon/" "$DIRG"/settings.ini
  sed -i "5s/=.*/=$gtk3_icon_c/" "$DIRG"/settings.ini
}

change_rofi() {
  cat "$DIRR"/colors/$bar.rasi > "$DIRR"/colors.rasi
}

change_vim() {
  sed -i "110s/.*/colorscheme $trm/" "$DIR"/.vimrc
}

if  [[ "$1" = "--ganyu" ]]; then
  trm="tokyonight"
  bar="ganyu"
  bg="Ganyu.png"
  gtk2='"Tokyo-Darker"'
  gtk2_icon='"Tela-circle-black-dark"'
  gtk2_icon_c='"Simp1e-Tokyo-Night"'
  gtk3='Tokyo-Darker'
  gtk3_icon='Tela-circle-black-dark'
  gtk3_icon_c='Simp1e-Tokyo-Night'
  change_alacritty
  change_bar
  change_dunst
  change_feh
  change_gtk
  change_rofi
  change_vim

elif  [[ "$1" = "--hsgrl" ]]; then
  trm="dracula"
  bar="hsgrl"
  bg="HSGrl.jpg"
  gtk2='"Dracula"'
  gtk2_icon='"Tela-circle-dracula-dark"'
  gtk2_icon_c='"Simp1e-Catppuccin"'
  gtk3='Dracula'
  gtk3_icon='Tela-circle-dracula-dark'
  gtk3_icon_c='Simp1e-Catppuccin'
  change_alacritty
  change_bar
  change_dunst
  change_feh
  change_gtk
  change_rofi
  change_vim

elif  [[ "$1" = "--mfuji" ]]; then
  trm="nord"
  bar="mfuji"
  bg="MFuji.jpg"
  gtk2='"Graphite-Dark"'
  gtk2_icon='"Tela-circle-black-dark"'
  gtk2_icon_c='"Simp1e"'
  gtk3='Graphite-Dark'
  gtk3_icon='Tela-circle-black-dark'
  gtk3_icon_c='Simp1e'
  change_alacritty
  change_bar
  change_dunst
  change_feh
  change_gtk
  change_rofi
  change_vim

else
  echo "No option specified, Available options: --ganyu  --hsgrl  --mfuji"
fi
