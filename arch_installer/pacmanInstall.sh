#!/bin/sh

pacman -S --needed sudo \
linux-xanmod linux-xanmod-headers linux-api-headers linux-firmware \
dhcpcd networkmanager firewalld \
xdg-user-dirs \
xorg-server xorg-server-common xorg-xkill xorg-xrandr xterm xvidcore \
fluxbox lightdm lightdm-gtk-greeter \
alsa-utils \
lxappearance nitrogen \
noto-fonts-emoji noto-fonts ttf-vista-fonts \
gnome-pie gnome-music gnome-terminal gnome-themes-extra gedit nautilus \
file-roller \
nano \
opera persepolis \
neofetch htop \
gtk2 gtk3 gtk4 \
python-pip python \
vlc \
gtk-engine-murrine gtk-update-icon-cache \
ntfs-3g \
gimp \
base-devel

rm -v pacmanInstall.sh

