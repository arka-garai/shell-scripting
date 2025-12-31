#!/bin/sh
# Program to count command line arguments and convert them to upper case

echo "The number of arguments are: $#"

v=$(echo "$*" | tr 'a-z' 'A-Z')

echo "$v"
