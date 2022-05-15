#!/bin/bash

# Change ".ext" according to extensions you want to be changed.
# This one works, below better solution
# ls -v | cat -n | while read n f; do mv -n "$f" "10$n.mp4"; done

# This from the problematic:
# Rename from 05_h.png to 05_half.png

#for file in *_h.png
#do
#	mv "$file" "$file{file/_h.png/_half.png}"
#done

#!/bin/bash

# this one works by taking the name of the folder where the files are
# initial number to add as incremental
n=1
# retrieving current folder name to be used as part of renaming
folderName=${PWD##*/}
# change extension as required
for fil in *.mp4; do
	# also change extension name
	mv "$fil" "${folderName}_$((n++)).mp4"
done


