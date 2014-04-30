#!/bin/sh

COMMAND=`awk -F: '($3 == 0) { print $1 }' /etc/passwd | grep -v '^root$'`

if [ x$COMMAND == x ]; then 
  echo pass;
else 
  echo fail;
fi