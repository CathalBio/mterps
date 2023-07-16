for POCKET in $(find -wholename "./*.pdb")
do
    echo "Working on" $POCKET
    cat $POCKET > scores.txt
    sed -i '20,85d' scores.txt
    sed -i '1,5d' scores.txt
    awk '{print $(NF)}' scores.txt > scoresf.txt
    cat $POCKET | grep ATOM > sinteractions.txt
    more sinteractions.txt | sort -n -k4 > sorted1.txt
    awk '{print $4}' sorted1.txt > sorted2.txt
    { for i in `< sorted2.txt` ; do echo -n $i ; done; echo; } > sortrot.txt
    sed 's/ALA/A/g;s/CYS/C/g;s/ASP/D/g;s/GLU/E/g;s/PHE/F/g;s/GLY/G/g;s/HIS/H/g;s/HID/H/g;s/HIE/H/g;s/ILE/I/g;s/LYS/K/g;s/LEU/L/g;s/MET/M/g;s/ASN/N/g;s/PRO/P/g;s/GLN/Q/g;s/ARG/R/g;s/SER/S/g;s/THR/T/g;s/VAL/V/g;s/TRP/W/g;s/TYR/Y/g;s/MSE/X/g' < sortrot.txt > suniqueaminos.txt
	POCKET2=$(echo "${POCKET#./}" | sed 's/\.pdb//')
    echo $POCKET2 > $POCKET2.txt
    cat scoresf.txt suniqueaminos.txt >> $POCKET2.txt

    rm -r s*.txt
    rm -r $POCKET
done
sync
