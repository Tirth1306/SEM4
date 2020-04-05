#!/bin/bash

read -p "Enter the file name with extension: " file
read -p "Enter the number of lines you want to display from start: " lines

counter=0

while IFS= read -r line
do
    echo $line
    counter=$(($counter + 1))
    if [ $counter -eq $lines ]
    then
        break
    fi
done < $file
    
