FROM php:7.2-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    wget

RUN docker-php-ext-install pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN addgroup --gid 1024 dockgroup
RUN adduser --disabled-password --gecos "" --force-badname --ingroup dockgroup dockuser
USER dockuser
