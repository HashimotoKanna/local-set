#!/bin/sh
SUDO_ASKPASS="$HOME/.config/polybar/script/zenity-pw-prompt.sh" sudo -A systemctl stop NetworkManager
SUDO_ASKPASS="$HOME/.config/polybar/script/zenity-pw-prompt.sh" sudo -A ifconfig wlo1 down
