#!/bin/sh

PERC=$(cat /sys/class/power_supply/BAT0/capacity)
STAT=$(cat /sys/class/power_supply/BAT0/status)

if [ "${STAT}" == "Charging" ]; then
    echo -e "\udc85 %{F#AAAAAA}*${PERC}%%%{F-}" 
elif [ "${STAT}" == "Not charging" ]; then
    echo -e "\ueb2d %{F#AAAAAA}${PERC}%%%{F-}"
else
    echo -e "\uf240 %{F#AAAAAA}${PERC}%%%{F-}"
fi