#!/bin/bash

docker compose down
echo "Clearing data"
#sudo chown -R rgt ./pg2/data
rm -rf ./pg2/data

echo "Starting postgres_master node..."
docker compose up -d  pg1
sleep 20 # Waits for Create Adventureworks database

echo "Prepare replica config..."
docker exec -it pg1 sh /t11pg/init.sh

echo "Starting slave node..."
docker compose up -d pg2
sleep 20 # Waits for note start complete

echo "Validate pg1: log_min_duration_statement, streaming replication, partner.partner"
docker exec -it pg1 sh /t11pg/validate.sh

echo "Validate pg2: log_min_duration_statement, streaming replication, partner.partner"
docker exec -it pg2 sh /t11pg/validate.sh

echo "Start MSSQL"
docker compose up -d mssql
sleep 20 #Waits for Start MSSQL

echo "Create database+table"
docker exec -it mssql sh /t11pg/createdb.sh

echo "Validate mssql"
docker exec -it mssql sh /t11pg/validate.sh




