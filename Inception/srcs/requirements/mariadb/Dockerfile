# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chajjar <chajjar@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/26 10:12:47 by chajjar           #+#    #+#              #
#    Updated: 2023/01/30 09:18:37 by chajjar          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# STEP 1: Get base image
FROM debian:buster

# STEP 2: Download requiered elements
RUN apt-get -y upgrade && apt-get -y update \
	&& apt-get install -y mariadb-server mariadb-client

# STEP 3: Duplicate configs and utilities in container
COPY tools_sys/start.sh /usr/local/bin
COPY conf/requete.sql /usr/local

# STEP 4: Create and setup mariadb directory
RUN mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql

# STEP 6: Run start.sh as entrypoint and expose the port
EXPOSE 3306
ENTRYPOINT [ "start.sh" ]

#Documentation des etatpes en francais
#Sélection de l'image de base Debian Buster
#Téléchargement des éléments requis, tels que MariaDB Server et MariaDB Client, en utilisant les commandes apt-get
#Copie des fichiers de configuration et des outils nécessaires dans le conteneur
#Création et configuration du répertoire MariaDB
#Exposition du port 3306 et définition du script de démarrage comme point d'entrée de l'image Docker