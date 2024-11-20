#!/bin/sh
IFS=$'\n'; for i in $(git ls-files --others --exclude-standard)
do
    if [ "x${i}" != "x" ]; then
        echo ">${i}"
        rm -f "${i}"
    fi
done
