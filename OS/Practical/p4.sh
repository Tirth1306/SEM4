echo "Enter the file name"
read f1

if test -f $f1
then
	if test -w $f1
	then
		echo "Enter the lines to be appended"
		cat >> $f1
	else
		echo "File does not have write permissions"
	fi
else
	echo "File does not exist"
fi
