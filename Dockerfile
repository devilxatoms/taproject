FROM php:7.0-apache
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>
ADD app/ /var/www/html
RUN a2enmod rewrite
RUN service apache2 restart

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip

RUN curl --silent --show-error https://getcomposer.org/installer | php

WORKDIR /var/www/html
RUN composer install --no-dev --no-interaction -o

EXPOSE 80
