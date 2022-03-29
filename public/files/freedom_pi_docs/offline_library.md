# Adding datasets to the offline library
1. Download .zim files from `https://download.kiwix.org/zim/` or other sources into `/home/pi/FreedomPi/public/files/kiwix` ([admin access docs](./admin_access.md))
2. Run
```cd /home/pi/FreedomPi/public/files/kiwix
kiwix-manage library.xml add *.zim`
sudo service kiwix restart```
