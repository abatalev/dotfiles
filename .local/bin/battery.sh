#!/bin/sh

PERC=$(cat /sys/class/power_supply/BAT0/capacity)
STAT=$(cat /sys/class/power_supply/BAT0/status)

if [ "${STAT}" == "Charging" ]; then
    echo -e "%{F#00AA00}\ueb2d${PERC}%%%{F-}" 
elif [ "${STAT}" == "Full" ]; then
    echo -e "%{F#00AA00}\ueb2d${PERC}%%%{F-}" 
elif [ "${STAT}" == "Not charging" ]; then
    echo -e "%{F#AAAAAA}\ueb2d${PERC}%%%{F-}"
else
    if [ $PERC -gt 15 ]; then
        echo -e "%{F#AAAAAA}\uf240${PERC}%%%{F-}"
    else 
        echo -e "%{F#AA0000}\uf240${PERC}%%%{F-}"
    fi
fi