#!/bin/bash
sudo apt install libssl-dev -y

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

mkdir /home/pi/src
cd /home/pi/src
git clone https://github.com/mmalmi/gun-rs.git --depth 1
# sudo chown -R pi:www-data gun-rs
cd gun-rs
cargo build --release # this takes many hours on slower devices like RPi Zero W - pre-built images needed

sudo su -c "echo \"[Unit]
Description=Gun-rs relay
After=network.target

[Service]
Type=simple
WorkingDirectory=/home/pi/src/gun-rs
ExecStart=/home/pi/src/gun-rs/target/release/gundb start
Restart=on-failure
User=www-data

[Install]
WantedBy=multi-user.target\" > /lib/systemd/system/gunrs.service"

sudo systemctl enable gunrs
sudo systemctl start gunrs
