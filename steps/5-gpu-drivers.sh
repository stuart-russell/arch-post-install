#!/bin/sh

# Install Nvidia GPU drivers if an Nvidia GPU is detected
if lspci | grep -i nvidia; then
    pacman -S nvidia nvidia-utils nvidia-settings lib32-nvidia-utils vulkan-icd-loader lib32-vulkan-icd-loader --noconfirm
elif lspci | grep -i amd; then
    pacman -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon --noconfirm
fi
