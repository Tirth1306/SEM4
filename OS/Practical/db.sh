table='table.txt'

selectData(){
	cat $table
}
n=0
while [ $n -ne 5 ]
do
	echo "-=-=-=-=-=-=:- Operations -:=-=-=-=-=-="
	echo "1.Fetch data"
	echo "2.Add data"
	echo "3.Edit data"
	echo "4.Remove Data"
	echo "5.EXIT"
	read n

	case $n in
		1)selectData
		;;
		2)
		echo "Enter Id:"
		read sid
		echo "Enter Name:"
		read name
		echo "Enter Division:"
		read div
		echo "$sid	$name	   $div" >> $table
		echo "record saved."
		selectData
		;;

		4)
		selectData
		temp='temp.txt'
		echo "Enter Id:"
		read sid
		grep -v $sid $table >> $temp
		$temp > $table
		rmdir $temp
		selectData
		;;

	esac

done
