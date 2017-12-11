#!/bin/bash

[[ -p /tmp/log ]] || mkfifo -m 0660 /tmp/log
su -l smokeping -s /bin/bash -c "exec /usr/sbin/smokeping --logfile=/tmp/log ${DEBUG:+--debug}"
tail -F /tmp/log
