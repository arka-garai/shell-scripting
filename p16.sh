#!/bin/bash
# Program to read five city names and sort them

echo "Enter the city names"

for ((i = 0; i < 5; i++)); do
  read city
  if [ $i -eq 0 ]; then
    echo "$city" >f1.txt
  else
    echo "$city" >>f1.txt
  fi
done

echo "Ascending sorted cities:"
sort f1.txt

echo "Descending sorted cities:"
sort -r f1.txt
