FROM library/postgres:15.3

RUN mkdir /t11pg

# Use own PG config
COPY ./pg2/postgresql.conf /etc/postgresql/postgresql.conf
COPY ./pg2/pg_hba.conf  /etc/postgresql/pg_hba.conf
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]

COPY /pg2/validate.sh /t11pg/

