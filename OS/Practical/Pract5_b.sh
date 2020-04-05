#!/bin/bash

read -p "Enter the file name with extension: " file
read -p "Enter the number of lines you want to display from end : " lines

counter=0
i=0
while IFS= read -r line
do
    i=$(($i+1))
done < $file

while IFS= read -r line
do 
    counter=$(($counter +1))
    if [ $counter -ge $(($i-$lines)) ]
    then
        echo $line
    fi
done < $file 