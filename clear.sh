#!/bin/sh
IFS=$'\n'; for i in $(git ls-files --others --exclude-standard)
do
    echo ">${i}"
    rm -f "${i}"
done
