#!/bin/bash
# wip: make configuration changes based on network status
link_detected_prev=0
while :
do
	# We check if ethernet cable is connected
	# Another option: check if dns for google.com resolves
	# Or check if tor has active connections?
	link_detected=$(ethtool eth0 2>/dev/null | grep "Link detected: yes" | wc -c)
	if [ $link_detected -ne $link_detected_prev ]; then
		if [ $link_detected -ne 0 ]; then
			# ethernet cable connected, route dns queries
		else
			# no ethernet, respond to dns queries with local address
		fi
	fi
	link_detected_prev=$link_detected
	sleep 10
done
