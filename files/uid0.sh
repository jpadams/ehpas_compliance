#!/bin/sh

#COMMAND=`awk -F: '($3 == 0) { print $1 }' /etc/passwd | grep -v '^root$'`
COMMAND=`cat /etc/passwd | awk -F: '($3 == 0) { print $1 }' | grep -v '^root$' | paste -sd:`
if [ x$COMMAND == x ]; then 
  echo uid0=pass;
else 
  echo uid0=fail;
  echo uid0_failures=$COMMAND
fi
