#!/bin/bash
day=`date +%w`
if [ ! $day == "0" ] && [ ! $day == "6" ]
then
	  echo `date +%a`
else
	  echo ""
fi

