# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chajjar <chajjar@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/26 10:14:08 by chajjar           #+#    #+#              #
#    Updated: 2023/01/30 09:11:04 by chajjar          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


# STEP 1: Get base image
FROM  debian:buster

# STEP 2: Download requiered elements
RUN apt-get -y upgrade \
    && apt-get -y update \
    && apt-get install -y nginx openssl

# STEP 3: Duplicate configs and utilities in container
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./tools_sys/start.sh /usr/local/bin

# STEP 4: Create self-signed SSL certificates
RUN openssl req -new -newkey rsa:2048 -nodes \
    -keyout /etc/chajjar.42.fr.key -out /etc/chajjar.42.fr.csr \
    -subj "/C=FR/ST=Alsace/L=Mulhouse/CN=chajjar.42.fr" \
    \
    && openssl x509 -req \
    -in /etc/chajjar.42.fr.csr -signkey /etc/chajjar.42.fr.key \
    -out /etc/chajjar.42.fr.crt

# STEP 5: Run start.sh as entrypoint and expose the port
EXPOSE 443
ENTRYPOINT [ "start.sh" ]

#Documentation Francais
#Docker qui exécute un serveur Nginx. Il effectue les actions suivantes :

#Il définit l'image de base à partir de laquelle sera créée la nouvelle image en utilisant l'image Debian buster.
#Il installe Nginx et OpenSSL en utilisant apt-get.
#Il copie les fichiers de configuration Nginx et un script de démarrage dans le conteneur.
#Il crée des certificats SSL auto-signés.
#Il définit le port 443 comme exposé et le script de démarrage comme point d'entrée de l'image Docker.