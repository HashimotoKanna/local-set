#!/bin/bash
icon=""
status=`systemctl is-active bluetooth.service`

if [ $status == "active" ]
then
	  echo ""
else
	  echo "$icon OFF"
fi

