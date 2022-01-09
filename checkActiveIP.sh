#!/bin/bash

#for ip in {1..254}
#do
#	sleep 0.05
#	ping -c 1 192.168.0.$ip | grep ^"64" | cut -d " " -f 4 &
#done


# Written in C Style
#for (( ip = 1; ip <= 254; ip++ ))
#do
#	sleep 0.05
#	ping -c 1 192.168.0.$ip | grep ^64 | cut -d " " -f4 &
#done


# While version
#ip=1

#while [ $ip -le 254 ]
#do
#	sleep 0.05
#	ping -c 1 192.168.0.$ip | grep ^64 | cut -d " " -f4 &
#	((ip++))
#done


# Until version
ip=1

until [ $ip -gt 254 ]
do
	sleep 0.05
	ping -c 1 192.168.0.$ip | grep ^64 | cut -d " " -f4 &
	ip=$[ $ip + 1 ] 
done


