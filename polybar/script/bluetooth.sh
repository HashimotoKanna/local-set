#!/bin/bash
status=`systemctl is-active bluetooth.service`

if [ $status == "active" ]
then
    icon=""
	echo "%{F#30a9de}$icon%{F-} ON"
else
    icon=""
    # echo ""
    echo "%{F#f00}$icon OFF"
fi
