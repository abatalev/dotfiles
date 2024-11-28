#!/bin/sh
if [ "$1" == "high" ]; then
    amixer set Master 5%+
fi
if [ "$1" == "low" ]; then
    amixer set Master 5%-
fi
if [ "$1" == "mute" ]; then
    amixer set Master toggle
fi