#!/bin/sh

# Enable TRIM for SSDs
systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# Update Mirrorlist
pacman -S reflector rsync --noconfirm
reflector --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist

# Install GuiMan
yay -S guiman --noconfirm
