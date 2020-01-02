#!/bin/bash
s=$(amixer get Master | tail -n1 | cut -d '[' -f2 | cut -d ']' -f1)
echo $s
if [ $s != "0%" ] ; then
    amixer set Master 0
else
    amixer set Master 50%
fi
