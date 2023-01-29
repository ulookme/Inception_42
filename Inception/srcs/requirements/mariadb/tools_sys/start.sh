#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chajjar <chajjar@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/26 10:13:05 by chajjar           #+#    #+#              #
#    Updated: 2023/01/29 18:09:29 by chajjar          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Declare variables
file=/usr/local/requete.sql
conf=/etc/mysql/mariadb.conf.d/50-server.cnf
env=(MARIADB_HOST MARIADB_DB MARIADB_USER MARIADB_PWD MARIADB_ADMIN_USER MARIADB_ADMIN_PWD)

# Apply env variables to the file
for i in "${env[@]}"; do
	sed -i "s/\$$i/${!i}/g" $file
done

# Install MySQL
# (Redirecting output to not have notice message)
mysql_install_db \
	--basedir=/usr --datadir=/var/lib/mysql \
	--user=mysql --rpm > /dev/null

# Finally apply the bootstrap
mysqld --user=mysql --bootstrap < $file

# Make MariaDB listen and respond
# to every network interfaces (for the docker structure)
# The address 0.0.0.0 will cause it to respond to any addresses
sed -i "s|skip-networking|# skip-networking|g" $conf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" $conf

# Run MariaDB
exec mysqld --user=mysql