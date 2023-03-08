#!/bin/bash

sh ./chaotic-aur.sh
echo "What is the AUR helper you'd like to install?"
echo "[paru, yay, pikaur, aura, pakku trizen]"
read -pr "--> " helper
sudo pacman -S $helper
