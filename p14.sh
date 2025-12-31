#!/bin/sh
# Program to perform arithmetic operations using command line arguments

v=$1

if [ $v = "-a" ]; then
  r=$(expr $2 + $3)
  echo $r

elif [ $v = "-s" ]; then
  r=$(expr $2 - $3)
  echo $r

elif [ $v = "-m" ]; then
  r=$(expr $2 \* $3)
  echo $r

elif [ $v = "-d" ]; then
  r=$(expr $2 / $3)
  echo $r

else
  echo "You chose the wrong input"
fi
