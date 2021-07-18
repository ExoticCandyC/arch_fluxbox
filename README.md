# Arch installer, fluxbox edition
auto script to install my arch with fluxbox window manager, and load all the settings for me, so i dont have to do them every single time

Installation
===
After you boot into the installation media, check for your internet connection. Then do as follows:

    pacman -Sy
    pacman -S git
    git clone https://github.com/ExoticCandyC/arch_fluxbox.git
    cd arch_fluxbox
    chmod +x install.sh
    ./install.sh

you will be told what to do next.

Download Size
===
First pacstrap phase is currently downloading 1045.50MB of data and has a ~4500MB foot print on hard drive.

Ram usage in IDLE mode is ~218MB when this build boots.

To do
=====
Add aria2 support for pacman so it downloads faster: https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#aria2

write the script for aur_pamac_install.sh

add pamac-manager to gnome-pie -> aur_pamac_install.sh

add pamac to pacman ignored list -> aur_pamac_install.sh

#DONE# There is a refference to ec user in fluxbox startup script. fix it.

#DONE, TEST IT OUT# Add --dpi 90 to xrandr on the startup

#NOT NEEDED ANYMORE# Add startup script to run persepolis, sleep for 1 second and then kill it

Add discord to the installer and gnome-pie. #added to the installer

xterm keeps opening with pink color. fix that one as well.

#DONE# also see if you can add the pre arch-chroot commands to it as well. we need two installer scripts. one for pre arch-chroot and one for post

add conky and my own conky setup to the build
