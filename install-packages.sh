#!/bin/bash

aur_packages=$(<aur-packages.txt)
pacman_packages=$(<pacman-packages.txt)

# Install all required packages
sudo pacman -S $pacman_packages --noconfirm
yay -S $aur_packages --noconfirm
