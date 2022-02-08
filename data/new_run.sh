#!/bin/bash

echo "INFO: Start /run.sh..." >&2
bash /run.sh &

sleep 1
#while ! ps | grep -q "nginx     0:00 {php-fpm8} php-fpm: pool elabpool$" -
while ! nc -z $DB_HOST $DB_PORT 2>/dev/null
do
echo "INFO: Waiting for DATABASE..." >&2
sleep 2
done

echo "INFO: Importing the database structure..." >&2
# Import the database structure:
bin/install start


tail -f /dev/null
