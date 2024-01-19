#!/bin/sh

CDIR=$(pwd)

cp -R ${HOME}/.config/ ${CDIR}/
cp ${HOME}/.xinitrc ${CDIR}/
cp ${HOME}/.xbindkeysrc ${CDIR}/
while IFS= read -r line
do
  echo "> ${CDIR}/${line}"
  if [ -d "${CDIR}/${line}" ]; then
    rm -R "${CDIR}/${line}"
  fi
done < ".gitignore"