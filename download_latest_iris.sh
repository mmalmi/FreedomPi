#!/bin/bash

mkdir /home/pi/FreedomPi/public/files/iris
cd /home/pi/FreedomPi/public/files/iris
curl -s https://api.github.com/repos/irislib/iris-electron/releases/latest \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -
