#!/bin/sh

# Clone yay from AUR and install
install_yay() {
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
}

sudo -u "$1" bash -c "$(declare -f install_yay); install_yay"
