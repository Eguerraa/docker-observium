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
#
OBSERVIUM_DB_NAME=observium
OBSERVIUM_DB_USER=observium
OBSERVIUM_DB_PASSWORD=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 28)
MYSQL_ROOT_PASSWORD=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 28)

# Set a password for the Observium web admin user here or use the default below.
# To login into the Observium web control panel, use this password and the
# user admin
#
OBSERVIUM_ADMIN_PASSWORD=$(</dev/urandom tr -dc A-Za-z0-9 | head -c 8)

# Please set your Observium domain name below.
# The domain name's IP address needs to point to this server.
# Traefik needs to be up & running, see README.md
# This domain name needs to be the same as configured in Traefik.
#
DOMAIN=observium.example.tld

# SMTP configuration
#
# Set EMAIL_ENABLE to TRUE and use proper smarthost and email settings if you want to receive
# alert emails from Observium.
#
EMAIL_ENABLE=FALSE
SMARTHOST_ADDRESS=mail.example.tld
SMARTHOST_PORT=587
SMARTHOST_USER=myuser
SMARTHOST_PASSWORD=secret

EMAIL_FROM=observium@example.tld

# Set this to TRUE if you want to send all Observium emails to the address specified below. When FALSE, 
# alert emails will be sent to the address in the SNMP contact information received from the queried host.
#
EMAIL_DEFAULT_RECIPIENT_ONLY=FALSE
EMAIL_DEFAULT_RECIPIENT=Admin <observium@example.tld>

EOF
