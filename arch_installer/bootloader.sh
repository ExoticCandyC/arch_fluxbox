#!/bin/sh

echo ""
echo ""
echo ""
echo "Installing bootloader. Please select your boot type:"
echo "1) Legacy"
echo "2) UEFI"

read BootType

case $BootType in
  1)
    echo "Setting up legacy bootloader."
    echo "Please enter the drive letter you want to install bootloader on: (/dev/sda)"
    read BootDrive 
    pacman -S --noconfirm grub os-prober
    mycmd=(grub-install)
    mycmd+=("$BootDrive")
    "${mycmd[@]}"
    rm /etc/default/grub
    cd GRUB
    cp grub/ /etc/default/grub
    tar zxvf theme.tar.gz
    cd theme
    chmod +x install.sh
    ./install.sh
    cd ..
    cd ..
    #theme installer makes the grub config
    #grub-mkconfig -o /boot/grub/grub.cfg
    ;;
     
  *)
    echo "Setting up UEFI bootloader."
    echo "Please enter the partition letter of your EFI drive: (/dev/sda1)"
    read EfiDrive
    pacman -S --noconfirm grub efibootmgr
    mkdir /boot/efi
    mycmd=(mount)
    mycmd+=("$EfiDrive")
    mycmd+=("/boot/efi")
    "${mycmd[@]}"
    grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
    rm /etc/default/grub
    cd GRUB
    cp grub/ /etc/default/grub
    tar zxvf theme.tar.gz
    cd theme
    chmod +x install.sh
    ./install.sh
    cd ..
    cd ..
    #theme installer makes the grub config
    #grub-mkconfig -o /boot/grub/grub.cfg
    ;;
esac

echo "bootloader installed succesfully."

rm -v bootloader.sh

