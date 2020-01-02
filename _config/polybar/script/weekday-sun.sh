#!/bin/bash
day=`date +%w`
if [ $day == "0" ]
then
	  echo `date +%a`
else
	  echo ""
fi

