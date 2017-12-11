<?php
$config['db_extension'] = 'mysqli';
$config['db_host']      = 'mysql';
$config['db_user']      = getenv('MYSQL_USER');
$config['db_pass']      = getenv('MYSQL_PASSWORD');
$config['db_name']      = getenv('MYSQL_DATABASE');

$config['rrd_dir']              = "/data/rrd";
$config['smokeping']['dir']     = "/var/lib/smokeping/";

