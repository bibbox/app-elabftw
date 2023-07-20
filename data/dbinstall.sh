#!/bin/bash

echo "Waiting for SQL container to be ready..."
for ((i=0; i<60; i++)); do
    if docker exec $INST-mysql mysqladmin ping -h $INST-mysql --silent; then
        echo "SQL container is ready!"
        break
    fi
    sleep 1
done

# Wait until the target container is reachable (maximum wait time: 60 seconds)
echo "Waiting for target container to be reachable..."
for ((i=0; i<30; i++)); do
    if curl_output=$(curl -IsS http://$INST-web:443); then
        if echo "$curl_output" | grep -q "HTTP/1.1 200 OK"; then
            docker exec $INST-web bin/console db:install
            docker exec $INST-web sed -i 's/session.cookie_secure = true/session.cookie_secure = false/' ../etc/php81/php.ini
            break
        elif echo "$curl_output" | grep -q "HTTP/1.1 302 Found"; then
            echo "Db already initialized"
            break
        fi
    fi
    sleep 2
done
