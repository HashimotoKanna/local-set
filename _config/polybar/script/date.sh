#!/bin/sh
CLOCK=$(date +%R)
DAY_NAME=$(date +%a)
MONTH=$(date +%b)
MONTH=$(date +%m)
DAY=$(date +%d)
YEAR=$(date +%Y)
printf "%s" "%{F#0ff}$CLOCK"
printf " "
printf "%s" "%{F#fff}$DAY_NAME"
printf " "
printf "%s" "%{F#47AFE2}$YEAR-$MONTH-$DAY"
#printf "%s" "%{F#47AFE2}$MONTH $DAY $YEAR"
