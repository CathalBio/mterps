# Version 0.01 Updated 26 Jan 2023
# based on the below command
# cat pocket1_atm.pdb | grep ATOM | uniq --skip-fields=3 --check-chars=9 | sort
cat pocket*_atm.pdb | grep ATOM >file1.txt
more file1.txt | sort -u -k4 >sorted1.txt
more sorted1.txt | uniq --skip-fields=3 --check-chars=10 > nowUnique.txt
more nowUnique.txt
cat nowUnique.txt file1.txt merged.txt
echo ">>> Here is the sorted unique file (nowUnique.txt)"

# How it works
# The first line grep's the original file looking for word ATOM putting the output in file1.txt
# The second line sorts the file on column 4 (should check for uniques but doesn't work right)
# The third line taked the output from line 2, skips the first 3 fields, then comaiirs the next 10 characters for uniqueness and puts the output in file sorted2.txt