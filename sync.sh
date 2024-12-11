#!/bin/sh

CDIR=$(pwd)

cp -R ${HOME}/.config/ ${CDIR}/
cp ${HOME}/.zshrc ${CDIR}/
cp ${HOME}/.xinitrc ${CDIR}/
cp ${HOME}/.xbindkeysrc ${CDIR}/
while IFS= read -r line
do
  if [ "x${line}" != "x" ]; then
    echo "> ${CDIR}/${line}"
    if [ -d "${CDIR}/${line}" ]; then
      rm -R "${CDIR}/${line}"
    fi
  fi
done < ".gitignore"