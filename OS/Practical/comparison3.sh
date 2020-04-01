echo "Enter two file: "
read f1
read f2

if [ ! -f $f1 -o ! -f $f2 ]
then
	echo "Please enter valid filenames"
else
	wc1=$(wc -l < $f1)
	wc2=$(wc -l < $f2)

	if [ $wc1 != $wc2 ]
	then
		echo "Files are not same"
	else
		while IFS= read -r -u 4 line1 && IFS= read -r -u 5 line2
		do
			if [ "$line1" == "$line2" ]
			then
				f="true"
			else
				f="false"
				break
			fi
		done 4<$f1 5<$f2

		if [ $f == "true" ]
		then
			echo "Files are same"
		else
			echo "Files are not same"
		fi
	fi
fi
