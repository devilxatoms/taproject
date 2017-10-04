FROM php:fpm
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
&& rm -rf /var/lib/apt/lists/* \
&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql

RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

RUN mkdir /var/lib/php/session
RUN chmod -R 777 /var/lib/php/sessio

EXPOSE 80
