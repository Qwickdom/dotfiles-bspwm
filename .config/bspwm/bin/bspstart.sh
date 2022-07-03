#! /bin/sh

pgrep -x sxhkd > /dev/null || sxhkd &
setxkbmap latam
xsetroot -cursor_name left_ptr
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# HDMI is connected?
hdmi_active=$(xrandr | grep ' connected' | grep 'HDMI' | awk '{print $1}')
if [[ ! -z "$hdmi_active" ]]; then
    $HOME/.config/bspwm/bin/HDMI1.sh
    sed -i "18s/:.*/: 5/" "$HOME"/.config/alacritty/fonts.yml
else
    $HOME/.config/bspwm/bin/eDP1.sh
    sed -i "18s/:.*/: 7/" "$HOME"/.config/alacritty/fonts.yml
fi

$HOME/.fehbg
$HOME/.config/bspwm/bin/styles.sh --ganyu

killall -9 picom clipster mpd
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config $HOME/.config/bspwm/picom.conf &
exec clipster -d &
exec mpd &
