#!/bin/sh

# Enable TRIM for SSDs
systemctl enable fstrim.timer

# Update Mirrorlist
pacman -S reflector rsync --noconfirm
reflector --country 'United Kingdom' --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist

# Install GuiMan
sudo -u "$1" yay -S guiman --noconfirm
