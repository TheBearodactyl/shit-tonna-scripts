#!/bin/bash

echo "What package(s) would you like to install?"
read -p "--> " pkgs
sudo pacman -S $pkgs
