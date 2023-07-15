FROM library/postgres:15.3

RUN apt-get update
RUN apt-get -y install unzip ruby dos2unix

RUN mkdir /t11pg

# Use own PG config
COPY ./pg1/postgresql.conf /etc/postgresql/postgresql.conf
COPY ./pg1/pg_hba.conf  /etc/postgresql/pg_hba.conf
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]


COPY ./pg1/init.sh /t11pg/
COPY ./pg2/postgresql.auto.conf /t11pg/postgresql.auto.conf
COPY /pg1/validate.sh /t11pg/


# Create database
COPY ./adventure/install.sql /t11pg/
COPY ./adventure/update_csvs.rb /t11pg/
COPY ./adventure/adventure_works_2014_OLTP_script.zip /t11pg/
RUN cd /t11pg && \
    unzip adventure_works_2014_OLTP_script.zip && \
    rm adventure_works_2014_OLTP_script.zip && \
    ruby update_csvs.rb && \
    rm update_csvs.rb

COPY ./adventure/dbinstall.sh /docker-entrypoint-initdb.d/

WORKDIR /t11pg/
RUN dos2unix /docker-entrypoint-initdb.d/*.sh
