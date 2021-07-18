#!/bin/sh

systemctl enable dhcpcd
systemctl enable firewalld
systemctl enable NetworkManager
systemctl enable lightdm

rm -v services.sh

