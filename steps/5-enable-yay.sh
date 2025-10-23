#!/bin/sh

# Clone yay from AUR and install
sudo -u $USERNAME git clone https://aur.archlinux.org/yay.git /tmp/yay
sudo -u $USERNAME cd /tmp/yay
sudo -u $USERNAME makepkg -si --noconfirm
sudo -u $USERNAME cd -
sudo -u $USERNAME rm -rf /tmp/yay
