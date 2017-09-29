FROM richarvey/nginx-php-fpm:latest
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>

ADD app/ /var/www/html

EXPOSE 80
