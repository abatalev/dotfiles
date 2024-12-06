#!/bin/sh
status=$(ps aux | awk '{ print $11; }' | grep "/usr/bin/syncthing" | wc -l)
if [ "x$status" == "x1" ]; then
    echo -e "%{F#00AA00}\uf2f1%{F-}"
else
    echo -e "%{F#AA0000}\uf2f1%{F-}"
fi