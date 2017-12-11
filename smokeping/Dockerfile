FROM debian:stretch-slim

ENV LC_ALL C

RUN \
    DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl           \
    smokeping      \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/smokeping \
    && chown smokeping:smokeping /var/run/smokeping \
    && mkfifo -m 0660 /tmp/log

COPY smokeping.sh /
CMD ["/smokeping.sh"]
