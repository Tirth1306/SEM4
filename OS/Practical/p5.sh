st1="good"
st2="bed"
st3=
[ $st1 = $st2 ]
echo $?
[ $st1 != $st2 ]
echo $?
[ -n "$st3" ]
echo $?
[ -z "$str3" ]
echo $?

st4="good morning"
st5="good evening"
[ $st4 = $st5 ]
echo $?
