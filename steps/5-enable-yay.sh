#!/bin/sh

# Clone yay from AUR and install
sudo -u $1 git clone https://aur.archlinux.org/yay.git /tmp/yay
sudo -u $1 cd /tmp/yay
sudo -u $1 makepkg -si --noconfirm
sudo -u $1 cd -
sudo -u $1 rm -rf /tmp/yay
