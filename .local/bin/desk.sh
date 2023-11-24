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
        DSK_OUT="$DSK_OUT [${dsk[$i]}:${i}]"
   else
        DSK_OUT="$DSK_OUT ${dsk[$i]}:${i}${dskw[$i]}"
   fi
done

echo "$DSK_OUT"