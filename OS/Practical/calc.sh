echo "Simple Calculator"

while [ "$task" != "0" ]
do
	echo "Enter the task you want to perform"
	echo "1. Addition"
	echo "2. Subtract"
	echo "3. Multiply"
	echo "4. Divide"
	echo "0. Exit"
	echo "-----------------------"
	read task
	if [ "$task" == "0" ]; then
		echo "Bye"
		break
	elif [ $task -gt 4 ]; then
		echo "Not sure What to do... Try again"
		continue
	fi
	echo "Enter two Numbers: "
	read -p 'First Number: ' a
	read -p 'Second Number: ' b
	if [ "$task" == "1" ]; then
		echo $a+$b | bc
	elif [ "$task" == "2" ]; then
		echo $a-$b | bc
	elif [ "$task" == "3" ]; then
		echo $a\*$b | bc
	elif [ "$task" == "4" ]; then
		echo $a/$b | bc -l
	fi
done
