# FreedomPi
Raspberry Pi wifi hotspot with an offline-first community portal. Optionally shares internet access over Tor.

## Install
1. Install Raspberry Pi Os Lite onto a microSD card using [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
2. Enable SSH by adding an empty file named "ssh" onto the SD card root directory. If you're not connecting to the Pi over ethernet, see instructions for [USB](https://desertbot.io/blog/ssh-into-pi-zero-over-usb) or [wifi](https://www.raspberrypi.com/documentation/computers/configuration.html#setting-up-a-headless-raspberry-pi) setup.
3. SSH into the Pi with the default password `raspberry`
```
ssh-keygen -R raspberrypi.local
ssh pi@raspberrypi.local
```
4. Change the default password using the `passwd` command
5. Set the WiFi country in raspi-config's Localisation Options: `sudo raspi-config`
6. Run the script `curl -sL https://raw.githubusercontent.com/mmalmi/FreedomPi/master/install.sh | bash`
