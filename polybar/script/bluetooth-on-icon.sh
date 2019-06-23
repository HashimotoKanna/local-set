#!/bin/bash
icon=""
status=`systemctl is-active bluetooth.service`

if [ $status == "active" ]
then
	  echo "$icon ON"
else
      echo ""
fi
