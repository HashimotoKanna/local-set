#!/bin/sh
SUDO_ASKPASS="$HOME/.config/polybar/script/zenity-pw-prompt.sh" sudo -A ifconfig wlo1 up
SUDO_ASKPASS="$HOME/.config/polybar/script/zenity-pw-prompt.sh" sudo -A systemctl start NetworkManager
