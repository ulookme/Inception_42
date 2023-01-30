USE mysql;
FLUSH PRIVILEGES;

GRANT ALL ON *.* TO '$MARIADB_ADMIN_USER'@'%' identified by '$MARIADB_ADMIN_PWD' WITH GRANT OPTION;
GRANT ALL ON *.* TO '$MARIADB_ADMIN_USER'@'localhost' identified by '$MARIADB_ADMIN_PWD' WITH GRANT OPTION;
SET PASSWORD FOR '$MARIADB_ADMIN_USER'@'localhost'=PASSWORD('$MARIADB_ADMIN_PWD');

DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;

CREATE DATABASE $MARIADB_DB CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED by '$MARIADB_PWD';
CREATE USER '$MARIADB_USER'@'localhost' IDENTIFIED by '$MARIADB_PWD';

GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'%';
GRANT ALL PRIVILEGES ON $MARIADB_DB.* TO '$MARIADB_USER'@'localhost';
FLUSH PRIVILEGES;

--Documentation francais
--Ce code permet de configurer une base de données MariaDB . Il effectue les actions suivantes :

--Utilise la base de données "mysql"
--Efface toutes les autorisations enregistrées
--Donne toutes les autorisations à un utilisateur appelé "$MARIADB_ADMIN_USER" avec le mot de passe "$MARIADB_ADMIN_PWD", tant depuis n'importe quelle adresse IP que depuis localhost
--Définit le mot de passe pour l'utilisateur "$MARIADB_ADMIN_USER" depuis localhost avec le mot de passe "$MARIADB_ADMIN_PWD"
--Supprime la base de données "test" si elle existe, puis efface à nouveau toutes les autorisations
--Crée une nouvelle base de données "$MARIADB_DB" avec le jeu de caractères "utf8" et la collation "utf8_General_ci"
--Crée deux utilisateurs : "$MARIADB_USER" avec le mot de passe "$MARIADB_PWD", tant depuis n'importe quelle adresse IP que depuis localhost
--Donne à l'utilisateur "$MARIADB_USER" toutes les autorisations sur la base de données "$MARIADB_DB", tant depuis n'importe quelle adresse IP que depuis localhost
--Efface une dernière fois toutes les autorisations enregistrée