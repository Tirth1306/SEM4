#!/bin/bash

read -p "Enter name of 1st file with extension" f1
read -p "Enter name of 2nd file with extension" f2
read -p "Enter the name of destination file" f3

if [ -e $f1 ]
then 
    if [ -e $f2 ]
    then 
        while IFS= read -r line
        do
            echo $line >> $f3
        done < $f1

        while IFS= read -r line
        do
            echo $line >> $f3
        done < $f2

        echo "Concatenated"
    fi
else 
    exit 0 
fi
