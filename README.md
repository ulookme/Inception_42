# Inception_42

Ce projet consistera à vous faire mettre en place une mini-infrastructure de différents
services en suivant des règles spécifiques. L’intégralité de ce projet est à réaliser dans une
machine virtuelle. Pour ce faire, vous devrez obligatoirement utiliser docker-compose.
Chaque image Docker devra obligatoirement porter le même nom que le service
concerné.
Chaque service devra tourner dans un container dédié.
Pour des raisons de performance, les containers devront être build au choix : soit sous
Alpine Linux avec l’avant-dernière version stable, soit sous Debian Buster.
Aussi, ils devront chacun posséder leur propre Dockerfile écrit par vos soins. Les
Dockerfiles seront appelés dans votre fichier docker-compose.yml par votre Makefile.
Vous devrez donc build vous-même les images Docker que vous utiliserez. Il est bien en-
tendu interdit d’en prendre des toutes faites, de même qu’utiliser des services tels que
DockerHub (Alpine et Debian étant exclus de cette règle).
Vous allez donc devoir mettre en place :
• Un container Docker contenant NGINX avec TLSv1.2 ou TLSv1.3 uniquement.
• Un container Docker contenant WordPress + php-fpm (installé et configuré) uni-
quement sans nginx.
• Un container Docker contenant MariaDB uniquement sans nginx.
• Un volume contenant votre base de données WordPress.
• Un second volume contenant les fichiers de votre site WordPress.
• Un docker-network qui fera le lien entre vos containers.
Vos containers devront redémarrer en cas de crash
