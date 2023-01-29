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