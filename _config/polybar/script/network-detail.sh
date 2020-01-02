#!/bin/bash

print_bytes() {
    FOREGROUND="%{F#888}"
    KB="kB/s%{F-}"
    MB="MB/s%{F-}"
    if [ "$1" -eq 0 ] || [ "$1" -lt 1000 ]; then

        bytes="0 $FOREGROUND$KB"
    elif [ "$1" -lt 1000000 ]; then
        bytes="$(echo "scale=0;$1/1000" | bc -l ) $FOREGROUND$KB"
    else
        bytes="$(echo "scale=1;$1/1000000" | bc -l ) $FOREGROUND$MB"
    fi

    echo "$bytes"
}

INTERVAL=3
PUBLIC_IP=$(curl -s ipinfo.io | jq '.ip' | cut -d"\"" -f2 2> /dev/null)
LOCATION=$(curl -s ipinfo.io | jq '.city' | cut -d"\"" -f2 2> /dev/null)
GATEWAY_IP=$(ip route | awk '/default/ {print $3}')
NETWORK=$(ip route | awk 'END {print $1}')
declare -A bytes

for interface in $INTERFACES; do
    bytes[past_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
    bytes[past_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"
done

while true; do
    down=0
    up=0

    for interface in $INTERFACES; do
        bytes[now_rx_$interface]="$(cat /sys/class/net/"$interface"/statistics/rx_bytes)"
        bytes[now_tx_$interface]="$(cat /sys/class/net/"$interface"/statistics/tx_bytes)"

        bytes_down=$((((${bytes[now_rx_$interface]} - ${bytes[past_rx_$interface]})) / INTERVAL))
        bytes_up=$((((${bytes[now_tx_$interface]} - ${bytes[past_tx_$interface]})) / INTERVAL))

        down=$(((( "$down" + "$bytes_down" ))))
        up=$(((( "$up" + "$bytes_up" ))))

        bytes[past_rx_$interface]=${bytes[now_rx_$interface]}
        bytes[past_tx_$interface]=${bytes[now_tx_$interface]}
    done

    GATEWAY_IP_TMP=$(ip route | grep default | cut -d ' ' -f 3)
    if [ ! $GATEWAY_IP == $GATEWAY_IP_TMP ] ||\
       [ -z $GATEWAY_IP ] ||\
       [ -z $PUBLIC_IP ]; then
        GATEWAY_IP=$GATEWAY_IP_TMP
        NETWORK=$(ip route | tail -n1 | cut -d ' ' -f 1)
        PUBLIC_IP=$(curl -s ipinfo.io | jq '.ip' | cut -d"\"" -f2 2> /dev/null)
        LOCATION=$(curl -s ipinfo.io | jq '.city' | cut -d"\"" -f2 2> /dev/null)
        echo "LOCATOIN:" $LOCATION
    fi

    printf "%s %s " "%{F#47AFE2 }%{F-}" $(print_bytes $down)
    printf "%s %s " "%{F#47AFE2}%{F-}" $(print_bytes $up)
    printf "%s %s " "%{F#47AFE2}%{F-} %{F#fff}$PUBLIC_IP" "%{F#81a2be}$LOCATION%{F-}"
    printf "%s " "%{F#0ff}"
    printf "%s " "%{F#47AFE2}%{F-} %{F#fff}$GATEWAY_IP"
    printf "%s\n" "%{F#81a2be}$NETWORK%{F-}"

    sleep $INTERVAL
done
