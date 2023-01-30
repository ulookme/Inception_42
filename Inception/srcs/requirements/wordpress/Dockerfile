# Base Image (Currently Most Stable Version 3.13)
FROM         debian:buster

# Package Installation
RUN         apt-get update -y && \
            apt-get install -y curl mariadb-client redis php7.3 php7.3-phar php7.3-json php7.3-curl php7.3-fpm php7.3-mysqli php7.3-iconv wget

RUN         wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 && \
            chmod +x /usr/bin/dumb-init && \
            mkdir -p /var/www/wordpress && \
            curl -s -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp && \
            chmod +x /usr/bin/wp && \
            wp core download --version=5.8.1 --path=/var/www/wordpress --allow-root

# STEP 3: Duplicate configs and utilities in container
COPY tools_sys/script.sh /usr/local/bin
COPY conf/php-fpm.conf /etc/php/7.3/fpm/
COPY conf/www.conf /etc/php/7.3/fpm/pool.d

# STEP 4: Create and setup wordpress user and directory
RUN mkdir -p /var/www/html \
	&& chown -R www-data:www-data /var/www/html \
	&& userdel -f www-data && useradd -u 82 www-data

# Permission Control
#RUN         chmod +x /tmp/script.sh \
#            && mkdir -p /var/www/html \
#			&& chown -R www-data:www-data /var/www/html \
#			&& userdel -f www-data && useradd -u 82 www-data

# STEP 6: Run script.sh as entrypoint and expose the port
EXPOSE 9000
WORKDIR /var/www/html/wordpress
ENTRYPOINT [ "script.sh" ]

###documentation francais
#Ce code est un script Docker qui définit l'image d'une application web Wordpress. Il fait les étapes suivantes:

#Définit l'image de base en utilisant "debian:buster"
#Installe les packages nécessaires pour l'application (curl, mariadb-client, redis, php7.3, etc.) en utilisant la commande "apt-get"
#Télécharge et configure "dumb-init" et "wp-cli"
#Copie des fichiers de configuration pour PHP et FPM
#Crée un utilisateur et un répertoire pour l'application
#Définit les ports exposés et le répertoire de travail pour l'application
#Définit le script d'entrée pour démarrer l'application.