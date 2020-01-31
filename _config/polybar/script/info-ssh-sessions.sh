#!/bin/bash

FILTER="([a-zA-Z0-9_-]+@([0-9]{1,3}\.){3}[0-9]{1,3}|[a-zA-Z0-9]+@[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,})"

sessions=""
count=0
while read -r line;do
    if [[ $(echo $line | cut -d' ' -f8) == "ssh" ]]; then
        tmp=$(grep -o -E $FILTER <<< $line)
        user=$(echo $tmp | cut -d'@' -f1)
        domain=$(echo $tmp | cut -d'@' -f2)
        sessions=$sessions"%{F#fff}$user%{F-}%{F#81a2be}@%{F-}%{F#0f0}$domain%{F-}%{F#0ff}/ %{F-}"
        count=`expr $count + 1`
    fi
done <<< "$(ps -ef | grep ssh)"

if [[ $count == 0 ]]; then
    echo ""
else
    result="%{F#30a9de}%{F-}%{F#0ff} %{F-}"
    echo $result$sessions
fi
