FROM ubuntu:16.04

RUN export LC_ALL=C.UTF-8
RUN DEBIAN_FRONTEND=noninteractive
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update
RUN apt-get install -y \
    autoconf \
    autogen \
    language-pack-en-base \
    wget \
    curl \
    rsync \
    git \
    build-essential \
    apt-utils \
    software-properties-common \
    python-software-properties \
    nasm \
    libjpeg-dev \
    libpng-dev \
    python2.7 \
    python-pip

RUN wget -q -O /tmp/libpng12.deb http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb \
  && dpkg -i /tmp/libpng12.deb \
  && rm /tmp/libpng12.deb    

# PHP
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php && apt-get update && apt-get install -y php7.1
RUN apt-get install -y \
    php7.1-curl \
    php7.1-gd \
    php7.1-dev \
    php7.1-xml \
    php7.1-bcmath \
    php7.1-mysql \
    php7.1-mbstring \
    php7.1-zip \
    php7.1-sqlite \
    php7.1-soap \
    php7.1-json \
    php7.1-intl \
    php7.1-imap \    
    php-xdebug \
    php-memcached
RUN command -v php

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update --preview
RUN command -v composer

# PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit
RUN command -v phpunit

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs -y
RUN command -v node
RUN command -v npm

# Gulp
RUN npm install -g gulp
RUN command -v gulp

# Display versions installed
RUN php -v
RUN composer --version
RUN phpunit --version
RUN node -v
RUN npm -v
RUN gulp --version
RUN python --version
