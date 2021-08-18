#!/bin/sh

# Apache enable ssl module
a2enmod ssl
a2enmod rewrite

# Generate a new self signed SSL certificate when none is provided in the volume
mkdir -p /etc/apache2/ssl
if [ ! -f /etc/apache2/ssl/moodle.key ] || [ ! -f /etc/apache2/ssl/moodle.crt ]; then
    openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/apache2/ssl/moodle.key -out /etc/apache2/ssl/moodle.crt -subj "/C=GB/ST=London/L=London/O=Self Signed/OU=IT Department/CN=moodle.org"
fi

# SSL permission
chown -R root:root /etc/apache2/ssl
chmod 700 /etc/apache2/ssl
chmod 600 /etc/apache2/ssl/moodle.crt
chmod 600 /etc/apache2/ssl/moodle.key

# Moodle directory
mkdir -p /var/www/html/moodle
chmod -R 0755 /var/www/html/moodle

# Moodle data
mkdir -p /var/moodledata
chown -R www-data:www-data /var/moodledata
chmod -R 777 /var/moodledata

# Quarantine ClamAV
mkdir -p /var/quarantine
chown -R www-data:www-data /var/quarantine
