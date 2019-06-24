#!/bin/sh
BOTTOM_BAR_ID=$(xdo id -N "Polybar" | tail -n1)
if xprop -id $BOTTOM_BAR_ID | grep -q "Normal"; then
    xdo hide -r $BOTTOM_BAR_ID
else
    xdo show -r $BOTTOM_BAR_ID
fi
