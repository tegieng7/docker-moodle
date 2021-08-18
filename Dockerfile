FROM ubuntu:20.04

VOLUME /etc/apache2/ssl
VOLUME /var/www/html/moodle
VOLUME /var/moodledata

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y --no-install-recommends install \
    supervisor \
    apache2 \
    cron \
    postfix \
    php \
    libapache2-mod-php \
    graphviz \
    aspell \
    ghostscript \
    clamav \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-ldap \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-pspell \
    php7.4-soap \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-zip \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY docker/ /

CMD ["/usr/bin/supervisord"]
