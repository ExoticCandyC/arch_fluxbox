#!/bin/sh

rm -r -v /root/* /root/.*
rm -r -v /home/exoticcandy/* /home/exoticcandy/.*
cp *.tar.gz /root/
mv extractRoot.sh /root/
mv *.tar.gz /home/exoticcandy/
mv extract.sh /home/exoticcandy/
chmod 777 /root/*.tar.gz
chmod 777 /root/extractRoot.sh
chmod 777 /home/exoticcandy/*.tar.gz
chmod 777 /home/exoticcandy/extract.sh
exec /root/extractRoot.sh
sudo -H -u exoticcandy bash -c 'exec /home/exoticcandy/extract.sh'

rm -v install.sh
