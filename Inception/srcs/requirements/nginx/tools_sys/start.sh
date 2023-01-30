#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chajjar <chajjar@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/26 10:14:00 by chajjar           #+#    #+#              #
#    Updated: 2023/01/26 10:14:01 by chajjar          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Test config file
nginx -t

# Run NGINX in foreground
# (Prevents from returning, thus preserves lifespan)
exec nginx -g "daemon off;"

#Documentation francais
#Ce code test la configuration du fichier de Nginx et le lance en arrière-plan en utilisant l'option "daemon off". Le premier commande, "nginx -t",
#teste la configuration pour s'assurer qu'elle est valide et ne produira pas d'erreur lors de l'exécution. La seconde commande, 
#"exec nginx -g 'daemon off;'" exécute Nginx en arrière-plan avec l'option "daemon off",
#ce qui permet de préserver la durée de vie de Nginx.