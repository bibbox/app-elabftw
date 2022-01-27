#!/usr/bin/env bash


mkdir -p data/mysql
mkdir -p data/web

docker network create bibbox-default-network

docker-compose up

docker exec -it bibbox-web bin/install start

#docker exec -it bibbox-mysql mysql -u elabftw --database="elabftw" --password="WnN8naVZZ4b8TrfAMSmyYeoz5vjbPTg" --execute='UPDATE config SET conf_value = "http://localhost:8080" WHERE conf_name = "url";'

docker exec -it bibbox-web sed -i 's/session.cookie_secure = true/session.cookie_secure = false' ../etc/php8/php.ini

