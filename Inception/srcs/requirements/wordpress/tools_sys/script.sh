#!/bin/bash

# Setup everything if nothing is set in stone
# (Usually on first lauch of the docker structure)
if [ ! -f "/var/www/html/wordpress/index.php" ]; then

	# Download the core elements
	# (Neccessary before doing anything)
	wp core download --allow-root

	# Initializes configs and add it to the database
	wp config create \
		--dbname=$MARIADB_DB --dbhost=$MARIADB_HOST \
		--dbuser=$MARIADB_USER --dbpass=$MARIADB_PWD \
		--dbcharset="utf8" --allow-root

	# Install and setup core elements of WordPress
	wp core install --url=chajjar.42.fr --title=$WP_TITLE \
		--admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL \
		--skip-email --allow-root

	# Set a theme and create an base user
	wp theme install blocksy --activate --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD \
		--role=author --allow-root

	# Create a new published post
	wp post create --post_type=post --post_title="Galere" --post_status=publish --allow-root

fi

# Run PHP FPM in foreground (FastCGI Process Manager)
# (Prevents from returning, thus preserves the container's lifespan)
exec php-fpm7.3 -F

###Documentation francais

#Le bloc "if [ ! -f "/var/www/html/wordpress/index.php" ]; then" vérifie si le fichier "index.php" de WordPress est déjà présent dans le répertoire "/var/www/html/wordpress/". Si ce n'est pas le cas, le script effectue les étapes d'installation et de configuration automatisées de WordPress.

#La commande "wp core download --allow-root" télécharge le coeur de WordPress.

#La commande "wp config create" crée les paramètres de configuration pour la base de données en utilisant les variables d'environnement telles que $MARIADB_DB, $MARIADB_HOST, etc.

#La commande "wp core install" installe le coeur de WordPress avec les paramètres de base tels que le titre du site, l'utilisateur administrateur, etc., définis par les variables d'environnement telles que $WP_TITLE, $WP_ADMIN_NAME, etc.

#La commande "wp theme install" installe un thème pour le site WordPress.

#La commande "wp user create" crée un utilisateur pour le site WordPress.

#La commande "wp post create" crée un nouveau billet de blog publié.

#Enfin, le script exécute "exec php-fpm7.3 -F" pour démarrer PHP-FPM en mode premier plan, ce qui empêche le script de se terminer et préserve ainsi la durée de vie du conteneur Docker