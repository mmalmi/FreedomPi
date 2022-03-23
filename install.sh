#!/bin/bash
# If you don't want to install a component, comment out the line

cd ~
sudo apt update -y
sudo apt upgrade -y
sudo apt install git -y
git clone https://github.com/mmalmi/FreedomPi.git
cd FreedomPi
sudo ./install_nginx.sh
sudo ./install_radio.sh
sudo ./install_hotspot.sh
sudo ./install_tor.sh
