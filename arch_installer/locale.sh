#!/bin/sh

echo "Setting locale and time zone."

timedatectl set-timezone Asia/Tehran

sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "" >> /etc/locale.conf

echo "Locale and time zone are all set."
sleep 1

rm -v locale.sh

