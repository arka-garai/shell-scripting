#!/bin/sh
# Fetch the mth line from a file and store it into another file

echo "Enter line number:"
read m

lim=$(wc -l <t1.txt)

if [ $m -le $lim ]; then
  head -$m t1.txt | tail -1 >t2.txt
  cat t2.txt
else
  echo "Line number is greater than maximum limit"
fi
