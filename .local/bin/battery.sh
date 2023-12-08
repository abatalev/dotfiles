#!/bin/sh

PERC=$(cat /sys/class/power_supply/BAT0/capacity)
STAT=$(cat /sys/class/power_supply/BAT0/status)

if [ "${STAT}" == "Charging" ]; then
    echo "*${PERC}" 
else
    echo " ${PERC}"
fi