#!/bin/sh
# Program to display system information

echo "The Main Memory information is:"
free -h

echo "The Disk information is:"
df -h

echo "The login name and hostname are:"
who
hostname

echo "The CPU information is:"
lscpu | grep -i "Architecture"
lscpu | grep -i "Thread"
lscpu | grep -i -w "Core"
lscpu | grep -i "max"
lscpu | grep -i "min"
lscpu | grep -i "cache"
