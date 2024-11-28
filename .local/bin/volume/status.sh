#!/bin/sh
if [ "$1" == "high" ]; then
    echo -e "%{F#AAAAAA}\uf028%{F-}"
fi
if [ "$1" == "low" ]; then
    echo -e "%{F#AAAAAA}\uf027%{F-}"
fi
if [ "$1" == "mute" ]; then
    echo -e "%{F#AAAAAA}\ueee8%{F-}"
fi
if [ "$1" == "volume" ]; then
    LV=$(amixer sget Master | awk -F"[][]" '/Left:/ { if ($4 == "off") {print "off"} else {print $2} }')
    RV=$(amixer sget Master | awk -F"[][]" '/Right:/ { if ($4 == "off") {print "off"} else {print $2} }')
    echo -e "%{F#AAAAAA}$LV|$RV %{F-}"
fi