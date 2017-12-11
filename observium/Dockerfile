FROM debian:stretch-slim

ENV LC_ALL C

RUN \
    sed -i "s/stretch main/stretch main contrib non-free/" /etc/apt/sources.list \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apache2               \
    curl                  \
    graphviz              \
    imagemagick           \
    ipmitool              \
    libapache2-mod-php7.0 \
    fping                 \
    mariadb-client        \
    mtr-tiny              \
    php7.0-cli            \
    php7.0-mysql          \
    php7.0-mysqli         \
    php7.0-gd             \
    php7.0-mcrypt         \
    php7.0-json           \
    php-pear              \
    python-mysqldb        \
    rrdtool               \
    snmp                  \
    subversion            \
    whois                 \
    imagemagick           \
    && rm -rf /var/lib/apt/lists/*

RUN \
    mkdir -p /opt \
    && cd /opt    \
    && curl -SL http://www.observium.org/observium-community-latest.tar.gz | tar zx \
    && mkdir -p ./observium/logs \
    && mkdir -p /data/rrd

RUN \
    a2dismod mpm_event     \
    && a2enmod mpm_prefork \
    && a2enmod php7.0      \
    && a2enmod rewrite

COPY conf/observium/config.php /opt/observium
COPY entrypoint.sh /
COPY generate-smokeping.sh /
COPY conf/httpd/default.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /opt/observium
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
