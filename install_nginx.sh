apt install php7.4-fpm nginx -y
systemctl enable php7.4-fpm
cp /home/pi/FreedomPi/config/nginx-site.conf /etc/nginx/sites-enabled/default
service nginx restart
chmod a+rw /home/pi/FreedomPi/share/files
