FROM php:7.4-apache

RUN apt-get update && apt-get install -y --no-install-recommends \
        nano \
        libicu-dev \
        libgd-dev \
        libpng-dev \
        libjpeg62-turbo-dev \
        libfreetype6-dev \
        libc-client-dev \
        libkrb5-dev \
        libonig-dev \
        libzip-dev \
        locales \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) intl pdo_mysql mbstring exif gd zip imap \
    && pecl install xdebug
#   \ && docker-php-ext-enable xdebug

# Add ja_JP.UTF-8
RUN locale-gen ja_JP.UTF-8

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install juman++
RUN apt-get update && apt-get install -y git wget build-essential libboost-all-dev \
    && wget -q http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-1.02.tar.xz \
    && tar Jxfv jumanpp-1.02.tar.xz \
    && cd jumanpp-1.02/ \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm jumanpp-1.02.tar.xz \
    && rm -rf /var/cache/*

# Create src directory
RUN mkdir -p /usr/local/src/php-jumanpp
