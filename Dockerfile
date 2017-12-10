FROM debian:stretch-slim

ENV LC_ALL C

RUN \
    sed -i "s/stretch main/stretch main contrib non-free/" /etc/apt/sources.list \
    && DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libapache2-mod-php7.0 \
    php7.0-cli     \
    php7.0-mysql   \
    php7.0-mysqli  \
    php7.0-gd      \
    php7.0-mcrypt  \
    php7.0-json    \
    php-pear       \
    snmp           \
    fping          \
    mariadb-client \
    python-mysqldb \
    rrdtool        \
    subversion     \
    whois          \
    mtr-tiny       \
    ipmitool       \
    graphviz       \
    imagemagick    \
    apache2        \
    curl           \
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

WORKDIR /opt/observium

COPY conf/observium/config.php ./
COPY entrypoint.sh /
COPY conf/httpd/default.conf /etc/apache2/sites-enabled/000-default.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
