#!/bin/bash

echo "THIS IS ONLY FOR MY PERSONAL USE"
sleep 10
iwctl station wlan0 connect "Bane of Gannon's Existance Guest" || iwctl station wlan0 connect "You'll put your eye out-guest"
sgdisk -Z /dev/nvme0n1
sgdisk -Z /dev/mmcblk0
cfdisk /dev/nvme0n1
cfdisk /dev/mmcblk0
mkfs.vfat -F32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
swapon /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3
mkfs.ext4 /dev/mmcblk0p1
pacman -Syy
reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
mount /dev/mmcblk0p1 /mnt
mkdir -p /mnt/{boot/efi,home}
mount /dev/nvme0n1p1 /mnt/boot/efi
mount /dev/nvme0n1p3 /mnt/home
pacstrap -K /mnt base linux linux-firmware vim
genfstab -U /mnt >> /mnt/etc/fstab
cp ./post-chroot.sh /mnt
arch-chroot /mnt /bin/bash
