FROM php:fpm
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>

RUN apt-get update
ADD app/ /var/www/html

EXPOSE 80
