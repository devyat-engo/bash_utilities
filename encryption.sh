#!/bin/bash

# This script encrypts a file or a directory for all users in one shot
# How to use:
# run script and name of File(s) and/or Directory(ies) and it will encrypt all in one shot
# For example:
# ./encryption.sh file.txt directory/ file2.txt
# Users to be added to be able to unlock the file can be added or removed

direcfunc() {
	FILES="$1"

	pushd $FILES

	for file_name in ./*; do
		enc_name="$file_name.asc"
		echo "Encrypting $file_name"

		gpg \
			-e \
			-a \
			--recipient email1@gmail.com \
			--recipient email2@hotmail.com \
			--output "$file_name.asc" \
			"$file_name"
		echo "Done! Output: $enc_name"
	done
	popd
} 


filefunc() {
	VAR="$PASSED"
	for file_name in $VAR; do
		enc_name="$file_name.asc"
		echo "Encrypting $file_name"

		gpg \
			-e \
			-a \
			--recipient email1@gmail.com \
			--recipient email2@hotmail.com \
			--output "$file_name.asc" \
			"$file_name"
		echo "Done! Output: $enc_name"
	done
} 


# PASSED=$@
for PASSED in $@
do
	if [ -d "$PASSED" ]
	then 
		echo "$PASSED is a directory"
		cd ./$PASSED
		direcfunc ;
	elif [ -f "$PASSED" ]
	then
		echo "$PASSED is a file"
		filefunc ;
	else
		echo "$PASSED is not valid"
		exit 1
	fi
done










