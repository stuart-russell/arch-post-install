#!/bin/sh

# Install and configure Flatpak
pacman -S flatpak --noconfirm
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
