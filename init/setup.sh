#!/bin/bash

#git clone https://github.com/utshina/uefi-simple
sudo apt install gcc-mingw-w64-x86-64-posix
sudo rm -rf /boot/efi/EFI/BOOT/hello.efi

sudo cp -ar original_grub /etc/default/grub
sudo rm -rf /etc/grub.d/50_my_os
sudo update-grub

#patch -N -p0 /etc/default/grub patch_grub
#diff -Nur original_grub /etc/default/grub

# remove grub loader

# timeout 
#/etc/default/grub

sudo efibootmgr
#efibootmgr -t 0
sudo efibootmgr --delete-bootnum -b 0003
sudo efibootmgr -o 0005,0004,0001,0002

