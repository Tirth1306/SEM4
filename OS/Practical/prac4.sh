echo "Enter the data to enter in data.txt"
filename="data.txt"

nol=0
read line
while [ "$line" != "end" ]
do
	echo "$line" >> "$filename"
	nol=`expr $nol + 1`
	read line
done

echo "Number of lines appended: $nol"

