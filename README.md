# t11pg2mssql

Sample docker project: creating a PostgreSQL streaming replication and putting some data into MSSQL

## Steps:

- Start a postgres DB. Use this Github repository to start https://github.com/lorint/AdventureWorks-.
for-Postgres.
- Start a second postgres DB docker container and create a streaming replica of the first one using
to the second postgres DB.
- Enable the long query log.
- Create index on tables
- Start an MSSQL DB. Use the official docker image https://hub.docker.com/_/microsoft-mssql-server
- Perform the migration of the sample data to MSSQL

## Usage:

- Create, run environment: docker-init.sh
- Used ports:
  - pg1: 127.0.0.1:5432
  - pg2: 127.0.0.1:5433
  - mssql: 127.0.0.1:1433

## Todo:

- Download adventure_works_2014_OLTP_script.zip automatically
- Using Apache HOP for data integration