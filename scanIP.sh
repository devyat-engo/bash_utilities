#!/bin/bash

# Script scans the network for active IPs
function main {
	ip=1

	until [ $ip -gt 254 ]
	do
		sleep 0.05
		ping -c 1 192.168.0.$ip | grep ^64 | cut -d " " -f4 &
		ip=$[ $ip + 1 ] 
	done
}

# For 24hrs runs the scan each 30min
# Logs the output to text file
for a in {1..48}
do
	date >> logScanIP.txt
	main | tee -a logScanIP.txt
	sleep 1800
done
