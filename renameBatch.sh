#!/bin/bash

# Change ".ext" according to extensions you want to be changed.
# This one works, below better solution
ls -v | cat -n | while read n f; do mv -n "$f" "10$n.mp4"; done

# This from the problematic:
# Rename from 05_h.png to 05_half.png

#for file in *_h.png
#do
#	mv "$file" "$file{file/_h.png/_half.png}"
#done
