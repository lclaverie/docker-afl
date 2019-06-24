FROM php:7.2-apache
MAINTAINER Vincent Falies <vincent.falies@gmail.com>

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libsqlite3-dev \
    libssl-dev \
    libcurl3-dev \
    libxml2-dev \
    libzzip-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    wget \
    libldap2-dev \
    pdftk \
    && docker-php-ext-install iconv json mbstring mysqli pdo_mysql pdo_sqlite phar curl ftp hash session simplexml tokenizer xml xmlrpc zip soap \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap

WORKDIR /mnt/filer/php5/

RUN a2enmod rewrite

CMD ["apache2-foreground"]
