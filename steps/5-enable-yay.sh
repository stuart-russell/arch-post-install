#!/bin/sh

local user="$1"

# Clone yay from AUR and install
install_yay() {
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
}

sudo -u "$user" bash -c "$(declare -f install_yay); install_yay"
