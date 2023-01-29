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