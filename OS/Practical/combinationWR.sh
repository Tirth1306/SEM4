for i in 1 2 3
do
	for j in 1 2 3
	do
		for k in 1 2 3
		do
			if [ $i -ne $j -a $j -ne $k -a $k -ne $i ]
			then
				echo "$i $j $k"
			fi
		done
	done
done
