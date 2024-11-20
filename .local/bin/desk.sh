#!/bin/bash

# 
# display bspwm desktops for monitor
#

DSK_FOCUS=$(bspc query -D -d focused --names)

declare -A dsk

for name in $(bspc query -D --names); do
     ((++i))
     dsk["${name}"]="${i}"
done

declare -A dskw
for name in $(bspc query -D -m ${1} -d .occupied --names); do
     dskw["${name}"]="*"
done


DSK_OUT=""
for i in $(bspc query -D -m ${1} --names); do
   if [ $i == $DSK_FOCUS ]; then
        DSK_OUT="$DSK_OUT %{F#FFFF00}${dsk[$i]}:${i}%{F-}"
   else
     if [ "-${dskw[$i]}-" == "-*-" ]; then
       DSK_OUT="$DSK_OUT %{F#006600}${dsk[$i]}:${i}%{F-}"
     else 
       DSK_OUT="$DSK_OUT %{F#AAAAAA}${dsk[$i]}:${i}%{F-}"
     fi 
   fi
done

echo "$DSK_OUT"