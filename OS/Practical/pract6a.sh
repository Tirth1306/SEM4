#!/bin/bash

read -p "Enter a number" num

i=1
while [ $i -le $num ]
do
    echo " $i * 2 = $(($i*2))"
    i=$(($i+1))
done