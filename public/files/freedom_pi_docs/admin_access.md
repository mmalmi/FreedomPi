# Admin access
## SSH
1. Add an empty file named "ssh" onto the root of the Raspberry Pi's SD card.
2. Connect to the Pi's network over the "Open freedompi.local" wifi or ethernet.
3. Connect to the Pi over SSH: `ssh pi@freedompi.local`
4. The default password is `raspberry`
5. Change the default password using the `passwd` command

## Manage files
1. Download an SCP software ([Windows](https://winscp.net/), [MacOS](https://cyberduck.io/), [Ubuntu](https://help.ubuntu.com/community/SSH/TransferFiles)).
2. Connect to `pi@freedompi.local`
3. http://freedompi.local/files directory is located at `/home/pi/FreedomPi/public/files`.
