#!/bin/bash

pgrep -x sxhkd > /dev/null || sxhkd &
xsetroot -cursor_name left_ptr
xwallpaper --zoom ~/wallpapers/postmarketos.png
picom &
dunst &
fcitx &
~/.config/polybar/launch.sh
bspswallow.sh

xset r rate 300 50
xset m 1/3 1

wmname LG3D
