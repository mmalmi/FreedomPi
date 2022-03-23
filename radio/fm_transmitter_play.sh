#!/bin/bash
while true
do
	for file in /home/pi/FreedomPi/radio/audio/*
	do
		sudo /home/pi/src/fm_transmitter/fm_transmitter -f 95.9 $file
		# sox "$file" -r 22050 -c 1 -b 16 -t wav - | sudo /home/pi/src/fm_transmitter/fm_transmitter -f 90 -
	done
done
