#!/bin/bash

cp _xprofile ~/.xprofile
cp _Xresources ~/.Xresource
cp _Xresources.d ~ -r
cp bg/ ~/Pictures/wallpaper-home -r
cp _config/alacritty ~/.config -r 
cp _config/compton ~/.config -r 
cp _config/i3 ~/.config -r 
cp _config/polybar ~/.config -r 
cp _config/rofi ~/.config -r 
cp _cache/wal ~/.cache -r 
sudo cp _usr/share/rofi/themes/onedark.rasi /usr/share/rofi/themes/

