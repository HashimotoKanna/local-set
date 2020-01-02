#!/bin/sh
state=$(xbacklight)
if [ $state == "100.000000" ]; then
    xbacklight -set 10
else
    xbacklight -set 100
fi
