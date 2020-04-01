while [ 1 ]
do
	echo " "
	echo " "
	echo "Directory Management"
	echo "-------------------"

	echo "0. Exit"
	echo "1. Show Present Working Directory"
	echo "2. Create a Directory"
	echo "3. Navigate"
	echo "4. remove directory/file"
	echo "5. move directory/file"
	echo "6. Rename Directory/file"
	echo "7. Change Directory/file Permission"
	echo "8. Show the contents of the pwd"
	echo "9. Create File"
	echo "10. Read File"
	echo "11. Appending into File"
	echo "12. Overwrite File"

	read c
	if [ "$c" == "0" ]
	then
		break
	elif [ "$c" == "1" ]
	then
		pwd
	elif [ "$c" == "2" ]
	then
		echo "Enter the name of the directory"
		read d
		if [ -d $d ]
		then
			echo "Directory already exist"
		else
			mkdir $d
		fi
	elif [ "$c" == "3" ]
	then
		echo "Navigation"
		echo "----------"
		echo "Enter the path to navigate"
		read p
		if [ -d $p ]
		then
			cd $p
		else
			echo "Invalid Address"
		fi
	elif [ "$c" == "4" ]
	then
		echo "Remove directory / file"
		echo "Enter the directory / file name:"
		read dr
		if [ -d $dr -o -f $dr ]
		then
			rm -r $dr
		else
			echo "Directory/File does not exists"
		fi

	elif [ "$c" == "5" ]
	then
		echo "Move directory / file"
		echo "Enter the directory / file name"
		read a
		if [ -d $a -o -f $a ]
		then
			echo "Enter the path"
			read pt
			if [ -d pt ]
			then
				mv $a $pt
			else
				echo "Path does not exist"
			fi
		else
			echo "Directory / File does not exists"
		fi

	elif [ "$c" == "6" ]
	then
		echo "Rename directory /File"
		echo "Enter the directory / File name"
		read ab
		if [ -d $ab -o -f $ab ]
		then
			echo "Enter the New Name"
			read pt
			mv $ab $pt
		else
			echo "Directory / File does not exists"
		fi
	elif [ "$c" == "7" ]
	then
		echo "Changing Permission"
		echo "Enter the directory / file name"
		read ab
		if [ -d $ab -o -f $ab ]
		then
			echo "Enter the Permission Numbers"
			read Permission
			if [[ $Permission ]] && [ $Permission -eq $Permission 2>/dev/null ]
			then
				chmod $Permission $ab
			else
				echo "Permission is not an integer or not defined"
			fi
		else
			echo "Directory / File does not exist"
		fi
	elif [ "$c" == "8" ]
	then
		ls
	elif [ "$c" == "9" ]
	then
		echo "Enter the filename"
		read fn
		if [ -f $fn ]
		then
			echo "File already exist"
		else
			touch $fn
		fi
	elif [ "$c" == "10" ]
	then
		echo "Enter the filename"
		read fn
		if [ -f $fn ]
		then
			cat $fn
		else
			echo "File Does not exist"
		fi

	elif [ "$c" == "11" ]
	then
		echo "Enter the filename"
		read fn
		if [ -f $fn ]
		then
			echo "Enter the input"
			read x
			cat x >> $fn
		else
			echo "File Does not exist"
		fi

	elif [ "$c" == "11" ]
	then
		echo "Enter the filename"
		read fn
		if [ -f $fn ]
		then
			echo "Enter the input"
			read x
			cat x > $fn
		else
			echo "File Does not exist"
		fi

	else
		echo "Not sure what to do. Exiting"
		break
	fi
done
