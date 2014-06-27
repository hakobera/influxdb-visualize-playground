#!/bin/bash

INFLUXDB_URI="http://192.168.77.22:8086"
DB_NAME="playground"

bundle install --path ./.bundle

echo "Vagrant up"
vagrant up

echo "Create Database"
curl -X POST "$INFLUXDB_URI/db?u=root&p=root" -d "{\"name\": \"$DB_NAME\"}"

echo "Create User"
curl -X POST "$INFLUXDB_URI/db/$DB_NAME/users?u=root&p=root" -d '{"name": "admin", "password": "admin"}'

bundle exec fluentd -c conf/fluent.conf -vv &
bundle exec dummer start -c conf/dummer.conf
