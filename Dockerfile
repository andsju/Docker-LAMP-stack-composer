FROM php:8.4-apache

RUN a2enmod ssl && a2enmod rewrite
RUN service apache2 restart
RUN apt-get update && apt-get install -y \
    git \ 
    zip \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libgd-dev \
    jpegoptim optipng pngquant gifsicle
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg
RUN docker-php-ext-install calendar gd mysqli pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer