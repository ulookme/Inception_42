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

####Documentation francais
#script Shell pour configurer et exécuter MariaDB (un système de gestion de base de données open-source) sur un système basé sur Unix/Linux. 
#Il effectue les tâches suivantes:

#Déclaration de variables:

#file: chemin vers le fichier requete.sql qui contient des instructions SQL à exécuter
#conf: chemin vers le fichier de configuration de MariaDB
#env: un tableau de variables d'environnement qui seront utilisées dans le script
#Application des variables d'environnement au fichier requete.sql à l'aide de la boucle "for" et de la commande "sed".

#Installation de MariaDB à l'aide de la commande "mysql_install_db". 
#Les informations de sortie sont redirigées pour ne pas afficher les messages d'avertissement.

#Exécution des instructions SQL dans le fichier requete.sql à l'aide de la commande "mysqld --bootstrap".

#Configuration de MariaDB pour écouter et répondre à toutes les interfaces réseau avec la commande "sed". 
#Cela est nécessaire pour la structure du conteneur Docker.

#Exécution de MariaDB avec la commande "exec mysqld --user=mysql".