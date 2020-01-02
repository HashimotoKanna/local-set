#!/bin/sh
xrandr --output eDP1  --primary --mode 1920x1080 --pos 0x0 --rotate normal
SIZE_HDMI='15.0'
SIZE_eDP1='11.0'
sed -i "/  size: $SIZE_HDMI/c\  size: $SIZE_eDP1" ~/.config/alacritty/alacritty.yml
