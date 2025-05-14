#!/bin/sh

pacman -Q | awk '{ print $1; }' > packages.current

diff -U0 packages.current packages.txt | awk '
/+/ { print substr($0,1); }
'
rm packages.current
