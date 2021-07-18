#!/bin/sh

echo "ec" > /etc/hostname

touch /etc/hosts
echo "" >> /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "127.0.1.1	ec.localdomain	ec" >> /etc/hosts
echo "::1	localhost" >> /etc/hosts

rm -v hosts.sh

