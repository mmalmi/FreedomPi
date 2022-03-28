![WIP](wip.gif "work in progress")
# Freedom Pi
* Raspberry Pi wifi access point
* Offline-first community portal that opens when you connect to the wifi
  * Chat that synchronizes over the sneaker network when people move between Freedom Pi hotspots
  * Filesharing tools
  * Offline databank. English mini version of Wikipedia is included by default. 
* Optionally shares internet access over Tor. Tor prevents internet censorship and protects open wifi providers from liability.
* Tools for FM radio broadcasting ([rpitx](https://github.com/F5OEO/rpitx), [fm_transmitter](https://github.com/markondej/fm_transmitter), web UI TBD)
  * No additional hardware required: it uses Raspberry Pi's spread spectrum clock signal generator to emit radio frequencies
  * Check your local regulations regarding transmission power and allowed frequencies. Low-power transmission (phone-to-car-radio transmitters) is usually allowed. For more power, you can add a wire antenna to the GPIO 4 port.
* $30 minimal setup: Raspberry Pi Zero W, microSD card and a power supply

## Installation

Requirements: microSD card, microSD reader, Raspberry Pi, power supply or USB cable

### Using a pre-built image
1. Download a pre-built Freedom Pi image from [releases](https://github.com/mmalmi/FreedomPi/releases) (upcoming)
2. Download [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
3. In Raspberry Pi Imager: Choose OS -> Use custom -> Select the downloaded image.
4. Optional: if you want to manage the Pi over SSH, add an empty file named "ssh" onto the root of the SD card. Remember to change the default password as soon as possible.
5. Insert the SD card into the Pi and power it on.
6. An open wifi network named Freedom Pi should appear soon.

### Custom installation
1. Install Raspberry Pi OS Lite onto a microSD card using [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
2. Enable SSH by adding an empty file named "ssh" onto the SD card root directory. If you can't connect to the Pi over ethernet, see instructions for [USB](https://desertbot.io/blog/ssh-into-pi-zero-over-usb) or [wifi](https://www.raspberrypi.com/documentation/computers/configuration.html#setting-up-a-headless-raspberry-pi) setup. For USB, also check out Internet connection sharing ([Macos](https://www.thepolyglotdeveloper.com/2019/07/share-internet-between-macos-raspberry-pi-zero-over-usb/), [Ubuntu](https://help.ubuntu.com/community/Internet/ConnectionSharing) (replace eth0 -> usb0), [Windows](https://www.circuitbasics.com/raspberry-pi-zero-ethernet-gadget/)).
3. Insert the SD card into the Pi and power it on.
4. SSH into the Pi with the default password `raspberry`
```
ssh-keygen -R raspberrypi.local
ssh pi@raspberrypi.local
```
5. Change the default password using the `passwd` command
6. Set the WiFi country in raspi-config's Localisation Options: `sudo raspi-config`. Reboot is not necessary.
7. Download the install script & run. Optionally comment out unwanted components. Enter your desired wifi name (ssid) when prompted.
```
wget https://raw.githubusercontent.com/mmalmi/FreedomPi/master/install.sh -O install.sh
chmod +x ./install.sh
./install.sh
```

## Adding datasets to library
1. Download .zim files from `https://download.kiwix.org/zim/` or other sources into `/home/pi/FreedomPi/public/files/kiwix`
2. Run
```cd /home/pi/FreedomPi/public/files/kiwix
kiwix-manage library.xml add *.zim`
sudo service kiwix restart```
