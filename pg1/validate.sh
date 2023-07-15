psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname Adventureworks <<-EOSQL
	SHOW log_min_duration_statement;
	SELECT * FROM pg_replication_slots;
	SELECT * from person.person limit 1;	
EOSQL