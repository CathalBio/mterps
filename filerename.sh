#!/bin/bash

# Rename directories containing relaxed_model_*_ptm_out.pdb files
for VARIABLE in $(find . -wholename "./*/*/output_directory/*/*/relaxed_model_*_ptm_out.pdb")
do
    echo -e "\nFull path (including file)" $VARIABLE
    substr="relaxed_model_";
    prefix=${VARIABLE%%$substr*};
    index=${#prefix}

    if [[ index -eq ${#str} ]];
    then
        echo "Substring is not present in string."
    else
        myNumber=${VARIABLE:index+14:1};
        myPath=${VARIABLE:0:index};
    fi

    IFS='/' read -ra array <<< "$VARIABLE"
    echo -e "Base folder / file =" ${array[2]} "/" ${array[5]}
    echo -e "Path to execute command in" "${VARIABLE%/*}"

    # Rename directory
    mv "${VARIABLE%/*}" $myPath${array[2]}_$myNumber
done
sync

# Rename directories containing pocket*_atm.pdb files
for VARIABLE2 in $(find . -wholename "./*/*/output_directory/*/*/*/pocket*_atm.pdb")
do
    IFS='/' read -ra array2 <<< "$VARIABLE2"
    myNumber2="${array2[5]}_$(grep -o '[0-9]*' <<< ${array2[7]}| tr -d '\n').pdb" # Add .pdb extension

    echo -e "Path to execute command in" "${VARIABLE2%/*}"
    echo working on... $VARIABLE2
    echo -e "array2(5) / array2(7) =" ${array2[5]} "/" ${array2[7]}
    echo "myNumber2" $myNumber2

    # Rename directory
    mv ${VARIABLE2} $myNumber2
done
sync
