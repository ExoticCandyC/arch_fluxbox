#!/bin/sh

# TODO: check for boot system here.
 
echo "installing aria2 download manager"
pacman -S --needed --noconfirm aria2

echo "keyserver hkp://keyserver.ubuntu.com" >> /etc/pacman.d/gnupg/gpg.conf
echo "Downloading andontie key file."
pacman-key --recv-key B545E9B7CD906FE3
echo "Adding andontie key file to the installer media."
pacman-key --lsign-key B545E9B7CD906FE3

echo "Setting up pacman to download with aria2 download manager."
sed -i 's/#XferCommand = \/usr\/bin\/curl -L -C - -f -o %o %u/XferCommand = \/usr\/bin\/aria2c --allow-overwrite=true --continue=true --file-allocation=none --log-level=error --max-tries=50 --max-connection-per-server=16 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 --timeout=10 --dir=\/ --out %o %u/g' /etc/pacman.conf

echo "Enabling multilib and andontie repositories for the installer media."
echo "" >> /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
echo "" >> /etc/pacman.conf
echo "[andontie-aur]" >> /etc/pacman.conf
echo "Server = https://aur.andontie.net/\$arch" >> /etc/pacman.conf
echo "" >> /etc/pacman.conf

pacman -Syy

pacstrap /mnt sudo \
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
  discord \
  base-devel \
  --noconfirm

genfstab -U /mnt >> /mnt/etc/fstab
cp arch_installer /mnt -r
chmod 777 /mnt/arch_installer/install.sh
arch-chroot /mnt /arch_installer/install.sh

################################

RED='\033[0;31m'
BRIGHT_CYAN='\033[0;96m'
BRIGHT_MAGENTA='\033[0;95m'
GREEN='\033[0;92m'
NC='\033[0m' # No Color

#clear
printf "\n\n\n\n\n\n${GREEN}Installation completed, please wait for your computer to restart.\n"
WaitTime=10
while [ $WaitTime != 0 ]; do
  case $WaitTime in
    7)
      printf "${BRIGHT_CYAN}"
      ;;
    4)
      printf "${BRIGHT_MAGENTA}"
      ;;
    2)
      printf "${RED}"
      ;;
  esac
  echo "Rebooting in $WaitTime."
  sleep 1
  WaitTime=$((WaitTime - 1))
done

printf "\n\n\n${BRIGHT_MAGENTA}Rebooting...${NC}"
sleep 1
echo ""

