#!/bin/bash
# If you don't want to download a component, comment out the line

# Kiwix
sudo apt install kiwix-tools
mkdir /home/pi/FreedomPi/public/files/kiwix
cd /home/pi/FreedomPi/public/files/kiwix
wget https://download.kiwix.org/zim/wikipedia/wikipedia_en_top_mini_2022-01.zim
kiwix-manage library.xml add *.zim

sudo sh -c "echo \"[Unit]
Description=Kiwix

[Service]
Type=simple
User=www-data
ExecStart=/usr/bin/kiwix-serve --library /home/pi/FreedomPi/public/files/kiwix/library.xml --address 127.0.0.1 --port 8080 --daemon --urlRootLocation library
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target\" > /lib/systemd/system/kiwix.service"

sudo systemctl enable kiwix
sudo systemctl start kiwix

# Iris
mkdir /home/pi/FreedomPi/public/files/iris
cd /home/pi/FreedomPi/public/files/iris
curl -s https://api.github.com/repos/irislib/iris-electron/releases/latest \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -i -
