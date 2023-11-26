#!/bin/sh

OS_ID=$(cat /etc/os-release | grep ^ID= | sed s/ID=//g)

if [ "${OS_ID}" == "arch" ]; then
    echo "Install packages"
    sudo pacman -S ly bspwm sxhkd \
        task zk fzf mutt thunderbird syncthing \
        zsh git vim \
        docker docker-compose
else
    echo "Unknown distro ($OS_ID)! Install packages skipped"
fi

echo "Build applications"

echo "Install configs"
if [ ! -f "${HOME}/.xinitrc" ]; then
    cp .xinitrc ${HOME}/.xinitrc
else 
    echo "File .xinitrc already exists. Skipped!"    
fi

cp -r -n .config/ ${HOME}/.config/
cp -r -n .local/ ${HOME}/.local/