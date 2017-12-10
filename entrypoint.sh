#!/bin/bash
set -e

/opt/observium/discovery.php -u
/opt/observium/adduser.php admin ${OBSERVIUM_ADMIN_PASSWORD} 10

exec "$@"

