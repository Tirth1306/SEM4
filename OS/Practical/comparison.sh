echo "Enter two file names: "
read f1 f2

bool="true"

while read lineA
do
    	while read lineB
        do
		if [ "$lineA" == "$lineB" ]
		then
			
		fi
        done < $f2
done < $f1
