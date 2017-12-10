#!/bin/bash

if [[ -f docker-observium.conf ]]; then
  read -r -p "A config file exists and will be overwritten, are you sure you want to contine? [y/N] " response
  case $response in
    [yY][eE][sS]|[yY])
      mv docker-observium.conf docker-observium.conf.bak
      ;;
    *)
      exit 1
    ;;
  esac
fi

cat << EOF > docker-observium.conf
# --------------------------------
#  docker-observium configuration
# --------------------------------

# Do not change
DBNAME=observium
DBUSER=observium
DBPASS=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 28)
DBROOT=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 28)

# Please set your Observium admin user password here or use the default below
ADMPASS=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 8)

# Please set your Observium domain name below.
# The domain name's IP address needs to point to this server.
# Traefik needs to be up & running, see README.md
# This domain name needs to be the same as configured in Traefik.
DOMAIN=observium.example.com

EOF

