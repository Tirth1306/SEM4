# w a s s  which will obtain marks of 5 subjects and assign a grade as follows
# % above = 60 -- first class
# % above = 50 -- seconds class
# % above = 40 -- third class
# % less = 39 -- Fail

echo "Enter the marks of 5 subjects out of 100"
read a b c d e
sum=$a+$b+$c+$d+$e|bc
avg=$sum/500|bc

if [$avg -ge 60]
then
	echo "First Class"
else
	if [$avg -ge 50]
	then
        	echo "Second Class"
	else
		if [$avg -ge 40]
		then
        		echo "Third Class"
		else
			echo "Fail"
		fi
	fi
fi
