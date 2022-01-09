#!/bin/bash

# The @ indicates that no matter how many parameters it will work, no need to indicate how many will be received 
for ip in "$@"
do
	echo "Testing $ip"
	ping1=$(ping -c 1 $ip | grep ^64 | cut -d " " -f4 | cut -d ":" -f1 &)
	if [ -n "$ping1" ]
	then
		echo "$ip is online"
	elif [ -z "$ping1" ]
	then
		echo "$ip is offline"
	else
		echo "Something is not right"
		exit 222
	fi
done
