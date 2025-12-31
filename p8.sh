#!/bin/sh
# Display default file permission and change permission based on option

echo "Enter the file name"
read f

echo "The default file permission is:"
ls -l $f

echo "Choose an option:"
echo "1) user=rwx, group=rw, other=r"
echo "2) user=rwx only"
echo "3) user, group, other = rwx"

read op

case $op in
1)
  chmod 764 $f
  ;;
2)
  chmod 700 $f
  ;;
3)
  chmod 777 $f
  ;;
*)
  echo "Invalid choice"
  ;;
esac

echo "Updated permission of file:"
ls -l $f
