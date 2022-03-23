while true
do
	for file in /home/pi/radio/audio/*
	do
		sox "$file" -r 22050 -c 1 -b 16 -t wav - | sudo /home/pi/src/fm_transmitter/fm_transmitter -f 90 -
	done
done
