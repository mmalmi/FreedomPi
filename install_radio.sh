#!/bin/bash
mkdir /home/pi/src
cd /home/pi/src
git clone https://github.com/markondej/fm_transmitter.git --depth 1

apt install sox libsox-fmt-mp3 -y
cd /home/pi/src/fm_transmitter

# rpi4: https://github.com/markondej/fm_transmitter#raspberry-pi-4
if [[ $(cat /proc/cpuinfo) == *"Raspberry Pi 4"* ]]; then
	make GPIO21=1
	echo "performance"| sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
else
	make
fi

echo "[Unit]
Description=FM radio broadcast
After=network.target

[Service]
Type=simple
ExecStart=/home/pi/FreedomPi/radio/fm_transmitter_play.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target" > /lib/systemd/system/fm_radio.service

systemctl enable fm_radio
systemctl start fm_radio

# cd /home/pi/src
# git clone https://github.com/F5OEO/rpitx
# cd /home/pi/src/rpitx
# ./install.sh
