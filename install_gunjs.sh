#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# TODO: install 16 if armv6 (pi zero), otherwise stable without mirror
NVM_NODEJS_ORG_MIRROR=https://unofficial-builds.nodejs.org/download/release nvm install 16
nvm install stable
node_path=$(which node)

mkdir /home/pi/src
cd /home/pi/src
git clone https://github.com/amark/gun.git gun-js --depth 1
sudo chown -R pi:www-data gun-js
chmod g+w gun-js
cd gun-js
npm install

sudo su -c "echo \"[Unit]
Description=Gun.js relay
After=network.target

[Service]
Type=simple
WorkingDirectory=/home/pi/src/gun-js
ExecStart=$node_path /home/pi/src/gun-js/examples/http.js
Restart=on-failure
User=www-data

[Install]
WantedBy=multi-user.target\" > /lib/systemd/system/gunjs.service"

sudo systemctl enable gunjs
sudo systemctl start gunjs
