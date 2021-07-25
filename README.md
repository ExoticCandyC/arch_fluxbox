# Arch installer, fluxbox edition
auto script to install my arch with fluxbox window manager, and load all the settings for me, so i dont have to do them every single time

CREDITS
===
GRUB theme: https://github.com/13atm01/GRUB-Theme

Greeter background: designed by myself, but containing elements designed by https://twitter.com/awan0918/

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

Issues:
===
#Done, Test it please# Boot loader problems.

The issue with bootloader is the symlink to /sbin/init doesn't generate. before making bootloader config, add "init=/lib/systemd/systemd" to /etc/default/grub.

https://wiki.ubuntu.com/systemd#Boot_loader_configuration

    GRUB_CMDLINE_LINUX_DEFAULT="init=/lib/systemd/systemd"

#FIXED# home extract.sh is not working. debug it (root is working just fine)


in .config: 

#DONE# 1) make xrandr execute in two lines (dpi in a separate line) 

#DONE# 2) fix persepolis font size (changed to 11)


Aria2 makes the downloads slower for small files.

To do 2
=====
https://askubuntu.com/questions/73804/wrong-login-screen-resolution

https://wiki.archlinux.org/title/LightDM#GTK_greeter

xrandr dpi is not being set, weird

Time zone is not being set.

Download time: 25 minutes, expected time: 11 minutes. Solve it.

Installation time: 4:35 , perfect

change icon for terminator in pie. it's showing as a black circle right now.

hide hidden files in nautilus.

add poweroff to the pie

remove -v from tar and rm commands in homes installer. the printing is taking too much time to be viable. add a prompt instead, so the user knows what are they waiting for.

mute the linux boot. it is showing prompts for everything.

GRUB customization.


To do
=====
Customize GRUB and LightDM.

add prompt to ask for username

Add poweroff to gnome-pie for shutdown. that command works without any problems.

Add aria2 support for pacman so it downloads faster: https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#aria2

write the script for aur_pamac_install.sh

add pamac-manager to gnome-pie -> aur_pamac_install.sh

add pamac to pacman ignored list -> aur_pamac_install.sh

add conky and my own conky setup to the build

#DONE# xterm keeps opening with pink color. fix that one as well.

#DONE# Add discord to the installer and gnome-pie.

#DONE# There is a refference to ec user in fluxbox startup script. fix it.

#DONE, TEST IT OUT# Add --dpi 90 to xrandr on the startup

#NOT NEEDED ANYMORE# Add startup script to run persepolis, sleep for 1 second and then kill it

#DONE# also see if you can add the pre arch-chroot commands to it as well. we need two installer scripts. one for pre arch-chroot and one for post

temp: https://github.com/zentyal/samba/blob/master/examples/smb.conf.default
