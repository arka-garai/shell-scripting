#!/bin/sh
# Program to calculate date difference between two dates (dd/mm/yyyy)

echo "Enter the 1st date in dd/mm/yyyy format"
read date1
echo $date1 >t1.txt

echo "Enter the 2nd date in dd/mm/yyyy format"
read date2
echo $date2 >t2.txt

d1=$(cut -d "/" -f1 t1.txt)
m1=$(cut -d "/" -f2 t1.txt)
y1=$(cut -d "/" -f3 t1.txt)

d2=$(cut -d "/" -f1 t2.txt)
m2=$(cut -d "/" -f2 t2.txt)
y2=$(cut -d "/" -f3 t2.txt)

# Swap dates if first date is greater than second
if [ $y1 -gt $y2 ]; then
  t=$y1
  y1=$y2
  y2=$t
  t=$m1
  m1=$m2
  m2=$t
  t=$d1
  d1=$d2
  d2=$t
fi

# Day calculation
if [ $d1 -gt $d2 ]; then
  d2=$(expr $d2 + 30)
  m2=$(expr $m2 - 1)
fi
dd=$(expr $d2 - $d1)

# Month calculation
if [ $m1 -gt $m2 ]; then
  m2=$(expr $m2 + 12)
  y2=$(expr $y2 - 1)
fi
dm=$(expr $m2 - $m1)

# Year calculation
dy=$(expr $y2 - $y1)

echo "The date difference is $dy year $dm month $dd days"
