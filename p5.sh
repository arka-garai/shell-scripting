#!/bin/sh

# 5. Write a shell script that takes the system time and displays an appropriate message as follows:
# “Good Morning”
# “Good Afternoon”
# “Good Evening”
# “Good Night”

# Get current hour (00–23)
h=$(date +%H)

if [ "$h" -lt 12 ]; then
    echo "Good Morning"
elif [ "$h" -lt 17 ]; then
    echo "Good Afternoon"
elif [ "$h" -lt 21 ]; then
    echo "Good Evening"
else
    echo "Good Night"
fi
