#!/bin/sh

pacman -S --noconfirm systemd-sysvcompat 

cd /arch_installer/

pacman -U --noconfirm otf-metropolis-r11-1-any.pkg.tar.zst

chmod +x pacman_repo.sh
#chmod +x pacmanInstall.sh
chmod +x aur_pamac_install.sh
chmod +x services.sh
chmod +x locale.sh
chmod +x hosts.sh
chmod +x passwd.sh
chmod +x ./home/install.sh
chmod +x bootloader.sh

./pacman_repo.sh
#./pacmanInstall.sh
./aur_pamac_install.sh
./services.sh
./locale.sh
./hosts.sh
./passwd.sh
cd home/
./install.sh
cd ..
./bootloader.sh

rm -v -r home
rm -v install.sh

