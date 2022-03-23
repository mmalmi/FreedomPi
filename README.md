![WIP](wip.gif "work in progress")
# FreedomPi
* Raspberry Pi wifi hotspot
* Optionally shares internet access over Tor. Tor prevents internet censorship and protects open wifi providers from liability.
* Offline-first community portal that opens when you connect to the wifi
  * Chat that synchronizes over the sneaker network, when people move between FreedomPi hotspots
  * Filesharing tools
* Tools for FM radio broadcasting ([rpitx](https://github.com/F5OEO/rpitx), [fm_transmitter](https://github.com/markondej/fm_transmitter), web UI)
  * No additional hardware required, uses Raspberry Pi's 

## Install
### Using existing image
1. Download an existing FreedomPi image from releases (upcoming)
2. Download [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
3. In Raspberry Pi Imager: Choose OS -> Use custom -> Select the downloaded image.
4. Optional: if you want to manage the Pi over SSH, add an empty file named "ssh" onto the root of the SD card. Remember to change the default password as soon as possible.
5. Insert the SD card into a Pi and power it on.
6. An open wifi network named FreedomPi should appear soon.

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

