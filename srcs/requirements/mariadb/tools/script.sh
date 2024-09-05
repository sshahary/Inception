#!/bin/bash

create_sql_file()
{
	cat << EOF > bootstrap.sql
	FLUSH PRIVILEGES;
	CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
	CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
	GRANT ALL PRIVILEGES on \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%';
	FLUSH PRIVILEGES;
EOF
}

run_bootstrap() {
	mysqld --user=mysql --bootstrap < bootstrap.sql
	rm -f bootstrap.sql
}

if [ ! -d "/var/lib/mysql/${SQL_DATABASE}" ]; then
	create_sql_file
	run_bootstrap
fi

exec /usr/sbin/mysqld --datadir=/var/lib/mysql --user=mysql