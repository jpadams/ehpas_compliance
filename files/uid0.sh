#!/bin/sh

# If the only user with UID 0 is root, the uid0 fact is set to pass.
# If there are any other users with UID 0 other than root, uid0 fact is set to fail.
# We create a valid JSON array of the usernames that have UID 0 but are NOT root.
# We return that JSON as the uid0_failures fact. Easy to use these values elsewhere later.
COMMAND=`cat /etc/passwd | awk -F: '($3 == 0) { print $1 }' | grep -v '^root$' | sed "s/^\|\$/\"/g" | paste -sd, | sed "s/^/[/" | sed "s/$/]/"`

if [ x$COMMAND == x ]; then 
  echo uid0=pass;
else 
  echo uid0=fail;
  echo uid0_failures=$COMMAND
fi
