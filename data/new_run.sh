#!/bin/bash

echo "INFO: Start /run.sh..." >&2
bash /run.sh &

sleep 1
#while ! ps | grep -q "nginx     0:00 {php-fpm8} php-fpm: pool elabpool$" -
while ! nc -z $DB_HOST $DB_PORT 2>/dev/null
do
echo "INFO: Waitung for DATABASE..." >&2
sleep 2
done

echo "INFO: Importing the database structure..." >&2
# Import the database structure:
bin/install start

#Disable secrue cookies (Incompatible with HTTP):
if grep -Fxq "session.cookie_secure = true" /etc/php8/php.ini
then
echo "INFO: Disable secrue cookies">&2

sed -i 's/session.cookie_secure = true/session.cookie_secure = false/' /etc/php8/php.ini

echo "INFO: Restart php-fpm8">&2
pkill php-fpm8

fi

tail -f /dev/null
