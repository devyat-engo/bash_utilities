#!/bin/bash

cleanup() {
	kill -9 $PID
}

trap cleanup SIGINT

python3 /Users/devyat/.utilities/standby.py &
PID=$!
echo "$PID"
sleep $1
kill -9 $PID

