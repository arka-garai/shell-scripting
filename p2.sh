#2. Write a shell script to print today’s date, current time and current month’s calendar

d=$(date +%d/%m/%y)

echo Today date is $d

echo the current time is $(date +%T)

echo the current month’s calendar is:

cal
