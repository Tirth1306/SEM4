echo "Enter the number: "
read a

rev=0
num=""
flag=1

while [ $a -gt 0 ]
do
	temp=`expr $a % 10`
	if [ "$temp" == "0" -a "$flag" == "1" ]
	then
		num+="0"
	else
		flag=0
		rev=`expr $rev \* 10`
		rev=`expr $rev + $temp`
	fi
	a=`expr $a / 10`
done

num+="$rev"

echo "Reversed Number is: $num"

