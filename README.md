# FreedomPi
Raspberry Pi wifi hotspot with an offline-first community portal. Optionally shares internet access over Tor.

## Install
### Using existing image
Download an existing FreedomPi image from releases (upcoming) and write it onto an SD card.

### Manual installation
1. Install Raspberry Pi Os Lite onto a microSD card using [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
2. Enable SSH by adding an empty file named "ssh" onto the SD card root directory. If you're not connecting to the Pi over ethernet, see instructions for [USB](https://desertbot.io/blog/ssh-into-pi-zero-over-usb) or [wifi](https://www.raspberrypi.com/documentation/computers/configuration.html#setting-up-a-headless-raspberry-pi) setup. For USB, also check out Internet connection sharing ([Macos](https://www.thepolyglotdeveloper.com/2019/07/share-internet-between-macos-raspberry-pi-zero-over-usb/), [Ubuntu](https://help.ubuntu.com/community/Internet/ConnectionSharing) (replace eth0 -> usb0), [Windows](https://www.circuitbasics.com/raspberry-pi-zero-ethernet-gadget/)).
3. SSH into the Pi with the default password `raspberry`
```
ssh-keygen -R raspberrypi.local
ssh pi@raspberrypi.local
```
4. Change the default password using the `passwd` command
5. Set the WiFi country in raspi-config's Localisation Options: `sudo raspi-config`. Reboot is not necessary.
6. Download the install script & run. Optionally comment out unwanted components. Enter your desired wifi name (ssid) when prompted.
```
wget https://raw.githubusercontent.com/mmalmi/FreedomPi/master/install.sh -O install.sh
chmod +x ./install.sh
./install.sh
```

