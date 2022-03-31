#!/bin/bash
while true
do
	for file in /home/pi/FreedomPi/radio/audio/*
	do
		if [[ $file == *".wav" ]]; then
			sudo /home/pi/src/fm_transmitter/fm_transmitter -f 90.0 $file
		else
			sox "$file" -r 22050 -c 1 -b 16 -t wav - | sudo /home/pi/src/fm_transmitter/fm_transmitter -f 90 -
		fi
	done
	sleep 1 # you can remove this if you added files into the audio directory
done
