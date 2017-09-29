FROM ubuntu:artful
MAINTAINER Brayan Caldera <ing.brayan.cm@gmail.com>

RUN apt-get update && \
  apt-get install -y \
    curl \
    git-core \
    supervisor
