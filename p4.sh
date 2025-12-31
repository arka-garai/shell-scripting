#!/bin/sh
# Write a shell script to find the largest number among three numbers

echo "Enter 3 numbers to find the largest"
read a
read b
read c

if [ $a -gt $b ] && [ $a -gt $c ]; then
  echo "Largest No. is $a"
elif [ $b -gt $a ] && [ $b -gt $c ]; then
  echo "Largest No. is $b"
else
  echo "Largest No. is $c"
fi
