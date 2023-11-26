#!/bin/sh

CDIR=$(pwd)
OS_ID=$(cat /etc/os-release | grep ^ID= | sed s/ID=//g)

if [ "${OS_ID}" == "arch" ]; then
    echo "Install packages"
    sudo pacman -S ly bspwm sxhkd \
        task taskwarrior-tui zk fzf mutt thunderbird syncthing \
        zsh git vim \
        docker docker-compose
else
    echo "Unknown distro ($OS_ID)! Install packages skipped"
fi

echo "Build applications"

if [ ! -d "$HOME/.config/oh-my-zsh" ]; then
    echo "Install oh-my-zsh"
    ZSH="$HOME/.config/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh already exists. Skipped!"
fi

echo "Install configs"
if [ ! -f "${HOME}/.xinitrc" ]; then
    cp .xinitrc ${HOME}/.xinitrc
else 
    echo "File .xinitrc already exists. Skipped!"    
fi

cp -r -n .config/ ${HOME}/.config/
cp -r -n .local/ ${HOME}/.local/

if [ ! -d "${HOME}/tmp" ]; then
    mkdir "${HOME}/tmp"
fi

if [ ! -f "${HOME}/.local/bin/lemonbar" ]; then
    echo "TODO build and install lemonbar"
    cd "${HOME}/tmp"
    git clone https://github.com/abatalev/lemonbar-xft-docker-build
    cd lemonbar-xft-docker-build
    chmod +x mk.sh
    ./mk.sh
    cp lemonbar "${HOME}/.local/bin/"
else 
    echo "lemonbar already exists. Skipped!"
fi

if [ ! -f "${HOME}/.local/bin/succade" ]; then
    echo "TODO build and install succade"
    cd "${HOME}/tmp"
    git clone https://github.com/abatalev/succade-docker-build
    cd succade-docker-build
    chmod +x mk.sh
    ./mk.sh
    cp succade "${HOME}/.local/bin/"
else 
    echo "succade already exists. Skipped!"
fi