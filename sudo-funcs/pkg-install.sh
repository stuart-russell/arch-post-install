#!/bin/bash

install_system_packages () {
    # Update Mirrorlist and Install base packages
    pacman -S flatpak reflector rsync sudo base-devel git curl wget zip unzip nano vim sddm man net-tools dnsutils noto-fonts noto-fonts-extra ttf-bitstream-vera ttf-dejavu ttf-droid ttf-fira-mono ttf-liberation ttf-opensans ttf-roboto --noconfirm
    # Update system packages
    pacman -Syu --noconfirm
}