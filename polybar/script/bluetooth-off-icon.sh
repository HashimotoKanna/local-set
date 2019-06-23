#!/bin/bash
icon=""
status=`systemctl is-active bluetooth.service`

if [ ! $status == "active" ]
then
	  echo "$icon OFF"
else
      echo ""
fi
