#!/bin/sh
RED='\033[0;31m'
BRIGHT_CYAN='\033[0;96m'
BRIGHT_MAGENTA='\033[0;95m'
GREEN='\033[0;92m'
NC='\033[0m' # No Color
printf "\n\n\n${BRIGHT_MAGENTA}Setting password for ${RED}root${BRIGHT_MAGENTA}. Please enter the password:\n\n${NC}"
passwd root
printf "${GREEN}Password successfully changed.${NC}"
sleep 1

printf "\n\n${BRIGHT_MAGENTA}Creating the user ${BRIGHT_CYAN}exoticcandy.${NC}"
useradd -m -g users -G wheel,storage,power -s /bin/bash exoticcandy
sleep 0.5

printf "\n${BRIGHT_MAGENTA}Giving access to wheel group to perform sudo.${NC}"
sed -i 's/#%wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers
sleep 0.5

printf "\n\n\n\n${BRIGHT_MAGENTA}Setting password for user ${BRIGHT_CYAN}exoticcandy${BRIGHT_MAGENTA}. Please enter the password:\n\n${NC}"
passwd exoticcandy
printf "${GREEN}Password successfully changed.${NC}\n"
sleep 2
printf "\n"
rm -v passwd.sh
