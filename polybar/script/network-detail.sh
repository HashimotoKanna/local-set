#!/bin/bash

print_bytes() {
    FOREGROUND="%{F#88}"
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

INTERVAL=2
INTERFACES="wlo1" PUBLIC_IP=$(curl ifconfig.co)
GATEWAY_IP=$(ip route | grep default | cut -d ' ' -f 3)

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

    if [ -z "$PUBLIC_IP" ];then
        PUBLIC_IP=$(curl ifconfig.co)
    fi
    if [ -z "$GATEWAY_IP" ]; then
        GATEWAY_IP=$(ip route | grep default | cut -d ' ' -f 3)
    fi

    printf "%s %s " "%{F#30a9de}%{F-}" $(print_bytes $down)
    printf "%s %s " "%{F#30a9de}%{F-}" $(print_bytes $up)
    printf "%s " "%{F#0ff}｜"
    printf "%s " "%{F#30a9de}PUBLIC%{F-} %{F#fff}$PUBLIC_IP" 
    printf "%s " "%{F#0ff}｜"
    printf "%s\n" "%{F#30a9de}GATE%{F-} %{F#fff}$GATEWAY_IP"
    #printf "| %s | " "%{F#0f0}PUBLIC%{F-} %{F#0ff}$PUBLIC_IP" 
    #printf "%s\n" "%{F#0f0}GATEWAY%{F-} %{F#0ff}$GATEWAY_IP"

    sleep $INTERVAL
done
