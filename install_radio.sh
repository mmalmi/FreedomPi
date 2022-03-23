mkdir /home/pi/src
cd /home/pi/src
git clone https://github.com/markondej/fm_transmitter

apt install sox libsox-fmt-mp3 -y
# on rpi4: https://github.com/markondej/fm_transmitter#raspberry-pi-4
cd /home/pi/src/fm_transmitter
make

echo "[Unit]
Description=FM radio broadcast
After=network.target

[Service]
Type=forking
ExecStart=/home/pi/FreedomPi/radio/radio_play.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target" > /lib/systemd/system/fm_radio.service

cp /home/pi/src/fm_transmitter/acoustic_guitar_duet.wav /home/pi/radio/audio/
systemctl enable fm_radio

# cd /home/pi/src
# git clone https://github.com/F5OEO/rpitx
# cd /home/pi/src/rpitx
# ./install.sh
