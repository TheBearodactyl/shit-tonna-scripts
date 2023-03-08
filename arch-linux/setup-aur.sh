#!/bin/bash

if [ -f /etc/pacman.d/chaotic-mirrorlist ]
then
    echo "What is the AUR helper you'd like to install?"
    echo "[paru, yay, pikaur, aura, pakku, trizen]"
    read -r -p "--> " helper
    sudo pacman -S $helper
else
    sh ./chaotic-aur.sh
    echo "What is the AUR helper you'd like to install?"
    echo "[paru, yay, pikaur, aura, pakku, trizen]"
    read -r -p "--> " helper
    sudo pacman -S $helper
fi
