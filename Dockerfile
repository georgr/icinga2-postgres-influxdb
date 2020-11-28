FROM debian:buster-slim

# add & update apt sources
RUN  export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y install apt-transport-https wget gnupg \
    && wget -O - https://packages.icinga.com/icinga.key | apt-key add - \
    && echo "deb https://packages.icinga.com/debian icinga-buster main" > /etc/apt/sources.list.d/buster-icinga.list \
    && echo "deb-src https://packages.icinga.com/debian icinga-buster main" >> /etc/apt/sources.list.d/buster-icinga.list \
    && apt-get update \
    && apt-get -y install \
    icinga2 \
    icinga2-ido-pgsql \
    monitoring-plugins \
    nagios-nrpe-plugin \
    nagios-plugins-contrib \
    nagios-snmp-plugins \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
