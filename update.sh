#!/bin/sh

echo "!!! cleaning"

IFS=$'\n'; for i in $(git ls-files --others --exclude-standard)
do
    echo "!!! delete ${i}"
    rm -f "${i}"
done

cp -u .xinitrc ${HOME}/
cp -r -u .config/* ${HOME}/.config/
cp -r -u .local/* ${HOME}/.local/
