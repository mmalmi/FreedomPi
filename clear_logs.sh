#!/bin/bash
# clear logs and bash history before making an image for distribution
sudo journalctl --rotate
sudo journalctl --vacuum-time=1s
sudo rm /var/log/*
sudo rm /var/log/nginx/*.log
rm -rf /home/pi/src/gun-js/radata
rm ~/.bash_history
sudo systemctl disable ssh
history -c
