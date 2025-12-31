#!/bin/sh
# Program to display a digital clock

while true; do
  tput setaf 7
  tput setab 0
  tput cup 10 40
  date +%T
  sleep 1
  clear
done
