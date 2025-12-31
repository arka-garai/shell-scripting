#!/bin/sh
# Write a shell script to add two numbers. Inputs are taken from user.

echo "Enter 2 numbers"
read a
read b

sum=$(expr $a + $b)

echo "Sum = $sum"
