#!/bin/sh

CDIR=$(pwd)

cp -R ${HOME}/.config/ ${CDIR}/
cp ${HOME}/.xinitrc ${CDIR}/
while IFS= read -r line
do
  echo "> ${CDIR}/${line}"
  if [ -d "${CDIR}/${line}" ]; then
    echo ">  !!!"
    rm -R "${CDIR}/${line}"
  fi
done < ".gitignore"