<?php
$config['db_extension'] = 'mysqli';
$config['db_host']      = 'mysql';
$config['db_user']      = getenv('OBSERVIUM_DB_USER');
$config['db_pass']      = getenv('OBSERVIUM_DB_PASSWORD');
$config['db_name']      = getenv('OBSERVIUM_DB_NAME');

$config['rrd_dir']               = '/data/rrd';
$config['smokeping']['dir']      = '/var/lib/smokeping/';

$config['email']['smtp_host']    = 'smtp';
$config['email']['from']         = getenv('EMAIL_FROM');
$config['email']['enable']       = getenv('EMAIL_ENABLE');
$config['email']['default_only'] = getenv('EMAIL_DEFAULT_RECIPIENT_ONLY');
$config['email']['default']      = getenv('EMAIL_DEFAULT_RECIPIENT');

