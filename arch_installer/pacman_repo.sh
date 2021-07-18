#!/bin/sh

echo "keyserver hkp://keyserver.ubuntu.com" >> /etc/pacman.d/gnupg/gpg.conf
echo "Downloading andontie key file."
pacman-key --recv-key B545E9B7CD906FE3
echo "Adding andontie key file."
pacman-key --lsign-key B545E9B7CD906FE3

echo "Enabling multilib and andontie repositories."
echo "" >> /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
echo "" >> /etc/pacman.conf
echo "[andontie-aur]" >> /etc/pacman.conf
echo "Server = https://aur.andontie.net/\$arch" >> /etc/pacman.conf
echo "" >> /etc/pacman.conf

pacman -Syy

rm -v pacman_repo.sh

