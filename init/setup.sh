#!/bin/bash

git clone https://github.com/utshina/uefi-simple
sudo apt install gcc-mingw-w64-x86-64-posix

patch -N -p0 /etc/default/grub patch_grub
#diff -Nur original_grub /etc/default/grub

# remove grub loader

# timeout 
/etc/default/grub

efibootmgr
efibootmgr -t 0
efibootmgr --delete-bootnum -b 0003


