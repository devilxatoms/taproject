FROM php:7.0-apache
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>
ADD app/ /var/www/html
RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80
