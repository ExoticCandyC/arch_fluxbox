#!/bin/sh

RED='\033[0;31m'
BRIGHT_CYAN='\033[0;96m'
BRIGHT_MAGENTA='\033[0;95m'
GREEN='\033[0;92m'
NC='\033[0m' # No Color

clear
printf "\n\n\n${GREEN}Thanks for using arch installer script, using fluxbox window manager.\n"
printf "${GREEN}This script was brought to you by ${BRIGHT_MAGENTA}ExoticCandyC${GREEN}.\n"


printf "\n${BRIGHT_CYAN}Make sure these steps have already been done:\n"
printf "1) Partition your hard drive using ${BRIGHT_MAGENTA}cfdisk${BRIGHT_CYAN}. You can use ${BRIGHT_MAGENTA}\"fdisk -l\"${BRIGHT_CYAN} to get a list of available drives.\n"
printf "2) Format your partitions with the following commands:\n"
printf "\t${BRIGHT_MAGENTA}mkfs.ext4 /dev/sda1${BRIGHT_CYAN}: To format /dev/sda1 as ${GREEN}ext4${BRIGHT_CYAN}.\n"
printf "\t${BRIGHT_MAGENTA}mkswap /dev/sda1${BRIGHT_CYAN}: To format /dev/sda1 as your ${GREEN}swap drive${BRIGHT_CYAN}.\n"
printf "\t${BRIGHT_MAGENTA}mkfs.fat -F32 /dev/sda1${BRIGHT_CYAN}: To format /dev/sda1 as your ${GREEN}EFI${BRIGHT_CYAN} drive.\n"
printf "3) Mount your root drive at ${GREEN}/mnt${BRIGHT_CYAN}.\n\tExample: ${BRIGHT_MAGENTA}mount /dev/sda1 /mnt${BRIGHT_CYAN}\n"
printf "3) If you have a home drive, mount it at ${GREEN}/mnt/home${BRIGHT_CYAN}.\n\tExample: ${BRIGHT_MAGENTA}mount /dev/sda1 /mnt/home${BRIGHT_CYAN}\n"
printf "3) If you have a swap drive, turn it on.\n\tExample: ${BRIGHT_MAGENTA}swapon /dev/sda1${BRIGHT_CYAN}\n"
printf "${RED}DO NOT MOUNT THE BOOT DRIVE IF IT IS A ${GREEN}EFI${RED} DRIVE.${BRIGHT_CYAN}\n"
printf "\tExample on how to unmount: ${BRIGHT_MAGENTA}unmount /dev/sda1${BRIGHT_CYAN}\n"

echo "Are you ready to start installation? (type \"YES I AM\" to start)"
read UserAnswer

if [ "$UserAnswer" != "YES I AM" ]; then
  printf "${GREEN}Run this installer again when you have done all the steps stated above.${NC}\n"
  exit
fi

clear
printf "\n\n\n"

WaitTime=5
while [ $WaitTime != 0 ]; do
  printf "${GREEN}Starting installation in $WaitTime.${NC}\n"
  sleep 1
  WaitTime=$((WaitTime - 1))
done

chmod +x pacstraper.sh
./pacstraper.sh

#rm /mnt/arch_installer -r
#reboot

