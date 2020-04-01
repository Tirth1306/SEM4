echo Enter two files:
read f1
read f2

if cp $f1 $f2
then 
	echo Success
else 
	echo Fail
fi
