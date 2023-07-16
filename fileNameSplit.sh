# Version 00.02 Last changed 15th April 2023
# fineNameSplit.sh   takes a file name and splits on a given character
#		for us we want to split on /
# Note: the file structure must be the same for all projects, 
#		which means if there are different levels of folder then this script won't work as is

for VARIABLE in $(find . -name *.pdb)
do
	echo -e "\nFull path (including file)" $VARIABLE
	count=0;
	IFS='/' read -ra array <<< "$VARIABLE";
# in the array the interesting elements are 2 and 5
#	2 base folder number of the project
#   5 is our target file name (including file number aka _1_)
    echo -e "Base folder / file =" ${array[2]} "/" ${array[5]};
    echo -e "Path to execute command in" "${VARIABLE%/*}"
    # The for loop below is just for debugging so we can see what is in the values
	#for i in "${array[@]}";
	#do
	#	echo "part" $count "is" "$i"
	#	echo "arrayx is" ${array[$count]}
	#	(( count++ ))
	#done
done

