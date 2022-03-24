#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
NVM_NODEJS_ORG_MIRROR=https://unofficial-builds.nodejs.org/download/release nvm install 16
node_path=$(which node)

mkdir /home/pi/src
cd /home/pi/src
git clone https://github.com/amark/gun.git gun-js --depth 1
chown -R pi:www-data gun-js
cd gun-js
npm install

sudo -c "echo \"[Unit]
Description=Gun.js relay
After=network.target

[Service]
Type=forking
ExecStart=$node_path /home/pi/src/gun-js/examples/http.js
Restart=on-failure

[Install]
WantedBy=multi-user.target\" > /lib/systemd/system/gunjs.service"

sudo systemctl enable gunjs
sudo systemctl start gunjs
