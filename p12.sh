#!/bin/sh
# Program to calculate area of rectangle, circle and triangle using functions

recArea() {
  echo "Enter the length of rectangle"
  read l
  echo "Enter the breadth of rectangle"
  read b
  rarea=$(echo "$l * $b" | bc)
  echo "The area of rectangle is $rarea"
}

cirArea() {
  echo "Enter the radius of circle"
  read r
  carea=$(echo "3.14 * $r * $r" | bc)
  echo "The area of circle is $carea"
}

triArea() {
  echo "Enter the height of triangle"
  read h
  echo "Enter the base of triangle"
  read b
  tarea=$(echo "0.5 * $h * $b" | bc)
  echo "The area of triangle is $tarea"
}

recArea
cirArea
triArea
