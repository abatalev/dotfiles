#!/bin/sh

echo "!!! cleaning"

IFS=$'\n'; for i in $(git ls-files --others --exclude-standard)
do
    if [ "x${i}" != "x" ]; then
        echo ">${i}"
        rm -f "${i}"
    fi
done

cp -u .xinitrc ${HOME}/
cp -r -u .config/* ${HOME}/.config/
cp -r -u .local/* ${HOME}/.local/

killall dunst
dunstify "DotFiles" Updated