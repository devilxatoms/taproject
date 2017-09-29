FROM richarvey/nginx-php-fpm:latest
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>

ADD app/ /var/www/html

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
