FROM php:7.0-apache
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>
ADD app/ /var/www/html
RUN a2enmod rewrite
RUN service apache2 restart

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip

RUN docker-php-ext-install pdo pdo_mysql


RUN curl --silent --show-error https://getcomposer.org/installer | php

EXPOSE 80
