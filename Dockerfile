FROM php:7.0-fpm
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>

USER root

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
libxml2-dev php-soap libssh2-1 libssh2-1-dev \
&& pecl install ssh2 &&  \
&& rm -rf /var/lib/apt/lists/* \
&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip soap

RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

ENV LOG_STREAM="/tmp/stdout"
RUN mkfifo $LOG_STREAM && chmod 777 $LOG_STREAM
CMD ["/bin/sh", "-c", "php-fpm -D | tail -f $LOG_STREAM"]

EXPOSE 80
