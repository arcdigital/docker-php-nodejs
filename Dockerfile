FROM ubuntu:20.04

RUN export LC_ALL=C.UTF-8
RUN DEBIAN_FRONTEND=noninteractive
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update && apt-get dist-upgrade

# PHP
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y php7.1
RUN apt-get install -y php8.1

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer
