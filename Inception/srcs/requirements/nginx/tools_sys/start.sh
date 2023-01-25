#!/bin/bash

# Test config file
nginx -t

# Run NGINX in foreground
# (Prevents from returning, thus preserves lifespan)
exec nginx -g "daemon off;"