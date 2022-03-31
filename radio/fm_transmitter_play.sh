#!/bin/bash
shopt -s nullglob
while true
do
	for file in /home/pi/FreedomPi/public/share/files/radio_playlist/*
	do
		if [[ $file == *".wav" ]]; then
			sudo /home/pi/src/fm_transmitter/fm_transmitter -f 88.3 $file || true
		else
			sox "$file" -r 22050 -c 1 -b 16 -t wav - | sudo /home/pi/src/fm_transmitter/fm_transmitter -f 88.3 - || true
		fi
	done
	sleep 1
done
