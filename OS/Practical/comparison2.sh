f=false
echo "Enter two file name"
read f1 f2
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


