#!/bin/bash
# If you don't want to install a component, comment out the line

cd ~
sudo apt update -y
sudo apt upgrade -y
sudo apt install git unattended-upgrades -y # automatic software update
sudo dpkg-reconfigure --priority=medium unattended-upgrades

sudo sh -c 'echo "LC_CTYPE=en_GB.UTF-8
LC_MESSAGES=en_GB.UTF-8
LC_ALL=en_GB.UTF-8" >> /etc/default/locale' # fixes annoying locale warnings

git clone https://github.com/mmalmi/FreedomPi.git
cd FreedomPi
sudo ./install_nginx.sh
./download_latest_iris.sh
sudo ./install_kiwix.sh
./install_gunjs.sh
sudo ./install_radio.sh
sudo ./install_hotspot.sh
sudo ./install_tor.sh
