#!/bin/bash
killall -q polybar
source ~/.cache/wal/colors.sh
export color0_alpha="#aa${color0/'#'}"

f()
{
    if [[ $1 == "--arrange" ]]; then
        eDP1_TOP_ARG="top-small"
        eDP1_BOTTOM_ARG="bottom-small"
        HDMI2_TOP_ARG="top-large"
        HDMI2_BOTTOM_ARG="bottom-large"
    elif [[ $1 == "--small" ]]; then
        eDP1_TOP_ARG="top-small"
        eDP1_BOTTOM_ARG="bottom-small"
        HDMI2_TOP_ARG="top-small"
        HDMI2_BOTTOM_ARG="bottom-small"
    fi
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [[ $m == "eDP-1" ]]; then
            echo $m $eDP1_TOP_ARG
            MONITOR=$m polybar --reload $eDP1_TOP_ARG &
            MONITOR=$m polybar --reload $eDP1_BOTTOM_ARG &
        fi
        if [[ $m == "eDP1" ]]; then
            echo $m $eDP1_TOP_ARG
            MONITOR=$m polybar --reload $eDP1_TOP_ARG &
            MONITOR=$m polybar --reload $eDP1_BOTTOM_ARG &
        fi
        if [[ $m == "HDMI2" ]]; then
            echo $m $HDMI2_TOP_ARG
            MONITOR=$m polybar --reload $HDMI2_TOP_ARG &
            MONITOR=$m polybar --reload $HDMI2_BOTTOM_ARG &
        fi
    done
}

case $1 in
--small | -s)
    f --small
;;
*)
    f --arrange
;;
esac
