FROM php:7.2.3-apache
COPY files/ /
RUN apt-get update && \
  apt-get install mysql-client -y && \
  docker-php-ext-install mysqli && \
  docker-php-ext-enable mysqli
