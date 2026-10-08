# WebGoatPHP ships no Dockerfile (upstream: a Vagrant box with Apache, PHP 5 and MySQL 5.5; copy the
# source to the document root, import SQL/webgoat.sql, set the database in
# app/config/application.php). This image does that on PHP 5.6 with Apache and mod_rewrite (for
# upstream's .htaccess): the source from app/ goes to /var/www/html/, the copied
# application.php gets the database name, account and host (db) the way upstream's
# app/config/setup.php fills it in, and runs in Develop mode for every web request (upstream
# switches to it when the host matches the development URL set at setup, as on its local
# installs; the lessons only load in that mode, and it shows PHP errors), and the command first
# starts setup-db.sh in the background, which imports SQL/webgoat.sql into the db machine once so
# the lab starts ready (guest / guest).
FROM docker.io/library/php:5.6-apache

RUN docker-php-ext-install mysqli pdo_mysql \
 && a2enmod rewrite \
 && printf '<Directory /var/www/html>\n  AllowOverride All\n</Directory>\n' > /etc/apache2/conf-enabled/webgoat.conf \
 && printf 'date.timezone = UTC\n' > /usr/local/etc/php/conf.d/webgoat.ini

COPY --chown=www-data:www-data app/ /var/www/html/
RUN cd /var/www/html/app/config \
 && sed -i -e 's/"DBNAME", "DBUSER", "DBPASS")/"webgoat", "webgoat", "webgoat", "db")/' \
      -e 's/strpos(HttpRequest::Host(), "LOCALHOSTURL") !== false/php_sapi_name() != "cli"/' \
      -e '/INITIALSETUP/d' application.php \
 && grep -q '"webgoat", "webgoat", "webgoat", "db"' application.php && ! grep -q LOCALHOSTURL application.php

COPY setup-db.sh /usr/local/bin/webgoat-setup-db
CMD ["sh", "-c", "sh /usr/local/bin/webgoat-setup-db & exec apache2-foreground"]
