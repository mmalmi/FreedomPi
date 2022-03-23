# https://nodogsplash.readthedocs.io/en/latest/customize.html#the-configuration-file
mkdir /home/pi/src
cd /home/pi/src
apt install git libmicrohttpd-dev -y
git clone https://github.com/nodogsplash/nodogsplash.git
cd /home/pi/src/nodogsplash
make
make install
echo "GatewayInterface wlan0
GatewayAddress 192.168.4.1" >> /etc/nodogsplash/nodogsplash.conf
cp /home/pi/src/nodogsplash/debian/nodogsplash.service /lib/systemd/system/
systemctl enable nodogsplash.service
# todo correct conf, this wrong?
