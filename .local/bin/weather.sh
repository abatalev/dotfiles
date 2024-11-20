#!/bin/sh
res=$(curl -s "https://wttr.in/spb?M&format=2")
echo -e "$res"
