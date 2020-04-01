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
	fi
	echo "Enter two Numbers: "
	read -p 'First Number: ' a
	read -p 'Second Number: ' b

	case $task in
		1)echo $a + $b | bc;;
		2)echo $a - $b | bc;;
		3)echo $a \* $b | bc;;
		4)echo $a / $b | bc -l;;
	esac
done
