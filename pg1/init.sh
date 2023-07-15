#!/bin/bash

set -e

#create replicator user
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'my_replicator_password';
    SELECT * FROM pg_create_physical_replication_slot('replication_slot_slave1');
EOSQL

#Backup master
pg_basebackup -D /var/lib/postgresql/data-slave -S replication_slot_slave1 -X stream -P -U replicator -Fp -R

# Init Slave
cp /t11pg/postgresql.auto.conf /var/lib/postgresql/data-slave
#cp /etc/postgresql/init-script/config/pg_hba.conf /var/lib/postgresql/data


