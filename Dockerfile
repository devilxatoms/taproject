FROM ubuntu:artful
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>

RUN apt-get update
RUN apt-get install nginx
