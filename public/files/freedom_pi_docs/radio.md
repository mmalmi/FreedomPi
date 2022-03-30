# Radio

Raspberry Pi has an in-built spread spectrum clock signal generator that can be used to emit radio frequencies.

Tools for FM radio broadcasting: [rpitx](https://github.com/F5OEO/rpitx), [fm_transmitter](https://github.com/markondej/fm_transmitter)

Check your local regulations regarding transmission power and allowed frequencies. Low-power transmission (phone-to-car-radio transmitters) is usually allowed. For more power, you can add a wire antenna to the GPIO 4 port.

By default, Freedom Pi uses fm_transmitter to play audio files from `/home/pi/FreedomPi/radio/audio`. You can add and remove these files over [SSH](./admin_access.md).

You can change the broadcast frequency by editing the script `/home/pi/FreedomPi/radio/fm_transmitter_play.sh`. Here you can also change the directory where audio files are loaded from.
