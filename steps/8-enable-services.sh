#!/bin/sh

# Enable TRIM for SSDs
systemctl enable fstrim.timer

# Update Mirrorlist
pacman -S reflector rsync --noconfirm
reflector --country 'United Kingdom' --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist

final_install() {
    sudo -u "$1" yay -S guiman --noconfirm
}

# Run final installation steps as the created user
sudo -u "$1" bash -c "$(declare -f final_install); final_install"
