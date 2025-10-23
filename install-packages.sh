#!/bin/bash

aur_packages=$(<inputs/aur-packages.txt)
pacman_packages=$(<inputs/pacman-packages.txt)

# Install all required packages
sudo pacman -S $pacman_packages --noconfirm
yay -S $aur_packages --noconfirm
