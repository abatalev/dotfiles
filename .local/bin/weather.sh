#!/bin/sh
# json https://wttr.in/spb?format=j1
res=$(curl -s "https://wttr.in/spb?M&format=2")
echo -e "$res"
