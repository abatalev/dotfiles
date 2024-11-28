#!/bin/sh
ping -c 3 192.168.0.4 >> /dev/null
if [ $? == 0 ]; then
    echo -e "%{F#AAAAAA}\uf015%{F-}"
else 
    echo -e "%{F#AA0000}\uf015%{F-}"
fi 