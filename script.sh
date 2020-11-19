#!/bin/bash

mount
echo '==================================================================='
read -p 'Partition to format: ' partition
declare -l choice
read -p 'Are you sure (y/N)? ' choice
declare -l validUnmount
echo -e ''

if [ "$choice" = "y" ]; then
	if [ -b "$partition" ]; then
		sudo umount $partition
		echo 'Unit is unmounting...'
		echo 'Unmounting done!'
		echo 'Formatting unit...'
		sudo mkfs -t vfat $partition 1>/dev/null
		echo 'Formatting done!'
	else
		echo "Error: This partition does not exist."
	fi
else
	echo 'Nothing was done.'
fi
