#!/bin/sh
cd /root/
for f in *.tar.gz; do tar -zxvf "$f"; done

sed -i 's/home\/exoticcandy\//root\//g' /root/.config/nitrogen/bg-saved.cfg
sed -i 's/home\/exoticcandy\//root\//g' /root/.config/nitrogen/nitrogen.cfg

xdg-user-dirs-update
fluxbox-generate_menu
rm -v *.tar.gz
rm -v extractRoot.sh
