#!/bin/sh
if [ ! $(xrandr --query | grep " connected" | wc -l) == 1 ]; then
    xrandr --output eDP1  --primary --mode 1920x1080 --pos 0x0 --rotate normal --same-as HDMI2
    xrandr --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --same-as eDP1
    xrandr --output eDP1  --primary --mode 1920x1080 --pos 0x0 --rotate normal --same-as HDMI2
fi

SIZE_HDMI='15.0'
SIZE_eDP1='11.0'

PRIMARY=$(xrandr --query | grep primary | cut -d' ' -f1)
if [ $PRIMARY == "HDMI2" ]; then
    ~/.config/i3/terminal_size.sh $SIZE_HDMI
    #sed -i "/  size: $SIZE_eDP1/c\  size: $SIZE_HDMI" ~/.config/alacritty/alacritty.yml
else
    ~/.config/i3/terminal_size.sh $SIZE_eDP1
    #sed -i "/  size: $SIZE_HDMI/c\  size: $SIZE_eDP1" ~/.config/alacritty/alacritty.yml
fi
