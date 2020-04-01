echo "Enter two file names: "
read f1 f2

if diff $f1 $f2 | read x
then
	echo "Not same file"
else
	echo "Same file"
fi
