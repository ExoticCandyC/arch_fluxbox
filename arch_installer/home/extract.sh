#!/bin/sh
cd /home/exoticcandy/
for f in *.tar.gz; do tar -zxvf "$f"; done

#sed -i 's/\/home\/ec\/.wallpaper\/1.jpg/\/home\/exoticcandy\/.wallpaper\/1.jpg/g' /home/exoticcandy/.config/nitrogen/bg-saved.cfg
#sed -i 's/\/home\/ec\/.wallpaper/home\/exoticcandy\/.wallpaper/g' /home/exoticcandy/.config/nitrogen/nitrogen.cfg

xdg-user-dirs-update
fluxbox-generate_menu
rm -v *.tar.gz
rm -v extract.sh
