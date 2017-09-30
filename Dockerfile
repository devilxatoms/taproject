FROM php:7.0-apache
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>
ADD app/ /var/www/html
#ADD sites.conf /etc/nginx/sites-enabled/default.conf

EXPOSE 80
