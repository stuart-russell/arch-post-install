#!/bin/sh

# Enable TRIM for SSDs
systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# Update Mirrorlist
pacman -S reflector rsync --noconfirm
reflector --country 'United Kingfom' --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist

# Install GuiMan
sudo -u $USERNAME yay -S guiman --noconfirm
