#!/bin/sh

rm -r -v /root/* /root/.*
rm -r -v /home/exoticcandy/* /home/exoticcandy/.*
sleep 1
cp *.tar.gz /root/
mv extractRoot.sh /root/
mv *.tar.gz /home/exoticcandy/
mv extract.sh /home/exoticcandy/
sleep 1
chmod 777 /root/*.tar.gz
chmod 777 /root/extractRoot.sh
chmod 777 /home/exoticcandy/*.tar.gz
chmod 777 /home/exoticcandy/extract.sh
sleep 1
exec /root/extractRoot.sh
sleep 1
sudo -H -u exoticcandy bash -c 'exec /home/exoticcandy/extract.sh'

rm -v install.sh
