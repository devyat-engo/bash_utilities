#!/bin/bash

echo -n "Enter the value you want to hash > "
read word
hashValue="$( echo -n "$word" | md5sum )"
echo "$hashValue"
