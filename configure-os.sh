#!/bin/bash

source ./sudo-funcs/package-install.sh
source ./sudo-funcs/service-enable.sh

sudo install_system_packages

reflector --country 'United Kingdom' --latest 10 --sort rate --fastest 5 --save /etc/pacman.d/mirrorlist

# Enable Multilib repositories
echo '' >> /etc/pacman.conf
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

# Install YAY AUR helper
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si --noconfirm
cd -
rm -rf /tmp/yay

# Install relevant GPU drivers
if lspci -vnn | grep VGA -A 3 | grep -i nvidia; then
    pacman -S nvidia nvidia-utils nvidia-settings lib32-nvidia-utils vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm
elif lspci -vnn | grep VGA -A 3 | grep -i amd; then
    pacman -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon --noconfirm
fi

# Configure Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable and start services
sudo enable_services
