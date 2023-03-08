#!/bin/bash

vim /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
echo thebearodactyluwu > /etc/hostname
touch /etc/hosts
echo "127.0.0.1     localhost" >> /etc/hosts
echo "::1           localhost" >> /etc/hosts
echo "127.0.1.1     thebearodactyluwu" >> /etc/hosts
passwd
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --bootloader-id=ARCH --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S sudo
useradd -m thebearodactyl
passwd thebearodactyl
usermod -aG wheel,audio,video,storage thebearodactyl
EDITOR=vim visudo
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com || return
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "" >> /etc/pacman.conf
echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
pacman -Syyu
vim /etc/pacman.conf
pacman -S xorg networkmanager fish plasma tmux git chromium alacritty base-devel fisher paru bass-fish
systemctl enable NetworkManager sddm
chsh -s /usr/bin/fish root
chsh -s /usr/bin/fish thebearodactyl
