#!/bin/bash
set -e
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'ZoldDiszno42' -i /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'ZoldDiszno42' -i ./t11pg/validate.sql