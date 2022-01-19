#!/usr/bin/env bash


mkdir -p data/mysql
mkdir -p data/web

docker network create bibbox-default-network

docker-compose up

docker exec -it elabftw bin/install start

