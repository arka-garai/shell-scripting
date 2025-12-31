#!/bin/sh
# Program to perform operations on student record file

echo "Choose options"
echo "1) Display CSE students"
echo "2) Count number of CSE students"
echo "3) Display IT students"
echo "4) Display students not in CSE"
echo "5) Count girl students in CSE"
echo "6) Display girl students in CSE"

read option

case $option in
1)
  grep -i "CSE" record.txt
  ;;
2)
  grep -i -c "CSE" record.txt
  ;;
3)
  grep -i -w "IT" record.txt
  ;;
4)
  grep -i -v "CSE" record.txt
  ;;
5)
  grep -i "CSE" record.txt | grep -i -c "F"
  ;;
6)
  grep -i "CSE" record.txt | grep -i "F"
  ;;
*)
  echo "Wrong Option"
  ;;
esac
