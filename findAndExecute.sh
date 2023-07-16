#!/bin/bash
# this script should be called findAndExecute.sh so it can exclude itself
#   from the run
all_files=` find ./ -name "*.sh" -type f`

for file in $all_files

do
	if [ $file == "./findAndExecute.sh" ] 
	then
		echo "Got our file so ignore...."
	else 
		echo " "
		echo "Going to Execute...." $file
		# echo "file Name: " "${file##*/}" # Gets file name only
		# echo "File Path: " "${file%/*}" # Gets path to file
		cd "${file%/*}"          # go into script folder
		chmod +x "${file##*/}"
		qsub "${file##*/}"  # execute our script
		cd ../                   # back to our parent folder
	fi
done
