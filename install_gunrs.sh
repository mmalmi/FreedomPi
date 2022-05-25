#!/bin/bash
sudo apt install libssl-dev -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

mkdir /home/pi/src
cd /home/pi/src
git clone https://github.com/mmalmi/rod.git --depth 1
# sudo chown -R pi:www-data rod
cd rod
cargo build --release # this takes many hours on slower devices like RPi Zero W - pre-built images needed

sudo su -c "echo \"[Unit]
Description=Rod relay
After=network.target

[Service]
Type=simple
WorkingDirectory=/home/pi/src/rod
ExecStart=/home/pi/src/rod/target/release/rod start
Restart=on-failure
User=www-data

[Install]
WantedBy=multi-user.target\" > /lib/systemd/system/rod.service"

sudo systemctl enable rod
sudo systemctl start rod
