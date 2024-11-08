#!/bin/sh

function mk_dir() {
    if [ ! -d "${1}" ]; then
        mkdir "${1}"
    fi
}

echo "!!! cleaning"

IFS=$'\n'; for i in $(git ls-files --others --exclude-standard)
do
    echo "!!! delete ${i}"
    rm -f "${i}"
done

echo "!!! Start install"

CDIR=$(pwd)
OS_ID=$(cat /etc/os-release | grep ^ID= | sed s/ID=//g)

if [ "${OS_ID}" == "arch" ]; then
    echo "!!! Install packages. Starting..."
    sudo pacman -S ly bspwm sxhkd \
        task taskwarrior-tui zk fzf mutt thunderbird syncthing \
        zsh git vim \
        wpa_supplicant \
        docker docker-compose \
        brightnessctl redshift jq \
        neovim tmux \
        amixer
else
    echo "!!! Unknown distro ($OS_ID)! Install packages skipped"
fi

if [ ! -d "${HOME}/.config/tmux/plugins/tpm" ]; then
    echo "!!! Tuning tmux. Starting..."
    mk_dir "${HOME}/.config/tmux"
    mk_dir "${HOME}/.config/tmux/plugins"
    git clone "https://github.com/tmux-plugins/tpm" "${HOME}/.config/tmux/plugins/tpm"
else    
    echo "!!! Tuning tmux. Skipped."
fi

echo "!!! Build applications"
if [ ! -d "$HOME/.config/oh-my-zsh" ]; then
    echo "!!! Install oh-my-zsh"
    ZSH="$HOME/.config/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "!!! Directory oh-my-zsh already exists. Skipped!"
fi

echo "!!! Install configs"
if [ ! -f "${HOME}/.xinitrc" ]; then
    cp .xinitrc ${HOME}/.xinitrc
else 
    echo "!!! File .xinitrc already exists. Skipped!"    
fi

cp -r -n .config/* ${HOME}/.config/
cp -r -n .local/* ${HOME}/.local/

mk_dir "${HOME}/tmp"

if [ ! -f "${HOME}/.local/bin/lemonbar" ]; then
    echo "TODO build and install lemonbar"
    cd "${HOME}/tmp"
    git clone https://github.com/abatalev/lemonbar-xft-docker-build
    cd lemonbar-xft-docker-build
    chmod +x mk.sh
    ./mk.sh
    cp lemonbar "${HOME}/.local/bin/"
else 
    echo "!!! Lemonbar already exists. Skipped!"
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
    echo "!!! Succade already exists. Skipped!"
fi

echo "!!! Tuning NeoVim" 
nvim --headless "+Lazy! sync" +qa

echo "!!! The end."
