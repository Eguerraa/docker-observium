#!/bin/sh
#su -l smokeping -s /bin/bash -c "exec /usr/sbin/smokeping --nodaemon"
su -l smokeping -s /bin/bash -c "exec /usr/sbin/smokeping --logfile=/tmp/log ${DEBUG:+--debug}"
tail -F /tmp/log
