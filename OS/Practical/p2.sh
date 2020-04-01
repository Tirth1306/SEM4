echo "Enter the first number: "
read a
echo "Enter the second number: "
read b

c=`expr $a + $b`
echo "Addition: $c"

d=`expr $a - $b`
echo "Subtraction: $d"

e=`expr $a \* $b`
echo "Multiplication: $e"

f=`expr $a / $b`
echo "Division: $f"

echo $a + $b | bc
