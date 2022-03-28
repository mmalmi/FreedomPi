#!/bin/bash

cd /home/pi/FreedomPi/public/files/kiwix
kiwix-manage library.xml add *.zim
sudo systemctl restart kiwix
