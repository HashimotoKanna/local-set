#!/bin/bash
status=`systemctl is-active bluetooth.service`

if [ $status == "active" ]
then
    SUDO_ASKPASS="$HOME/.config/polybar/script/zenity-pw-prompt.sh" sudo -A systemctl stop bluetooth
else
    SUDO_ASKPASS="$HOME/.config/polybar/script/zenity-pw-prompt.sh" sudo -A systemctl start bluetooth
fi
