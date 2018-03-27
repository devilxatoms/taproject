FROM php:7.0-fpm
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>

USER root

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev libxml2-dev\
&& rm -rf /var/lib/apt/lists/* \
&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip soap

# Set the locale
RUN apt-get install -y locales
RUN locale-gen es_MX.UTF-8

# Redis
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

# ssh2
RUN apt-get update && \
apt-get install -y gcc make autoconf libc-dev pkg-config \
&& apt-get install -y libssh2-1-dev \
&& pecl install ssh2-1.1.2 \
&& docker-php-ext-enable ssh2

ENV LOG_STREAM="/tmp/stdout"
RUN mkfifo $LOG_STREAM && chmod 777 $LOG_STREAM
CMD ["/bin/sh", "-c", "php-fpm -D | tail -f $LOG_STREAM"]

EXPOSE 80
