#!/bin/sh
mem=$(free | grep Mem | awk '{printf "%.f%%\n", ($3/$2 * 100.0)}')
swp=$(free | grep Swap | awk '{ if($3 == 0) {printf "-"} else { printf "%.f%%\n", ($3/$2 * 100.0)}}')
echo "[$mem|$swp]"
