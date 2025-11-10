#!/bin/bash

PACMAN_PKGS=$(grep -vE '^\s*#|^\s*$' packages/pacman.txt | xargs)
sudo pacman -S --needed --noconfirm $PACMAN_PKGS

YAY_PKGS=$(grep -vE '^\s*#|^\s*$' packages/yay.txt | xargs)
yay -S --needed --noconfirm $YAY_PKGS
