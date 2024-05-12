FROM php:8.3.6-fpm-alpine

WORKDIR /var/www/html

RUN apk --no-cache add \
    git \
    openssh-client \
    curl \
    openssl \
    bash \
    unzip \
    libzip-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libxpm-dev \
    freetype-dev \
    imagemagick-dev \
    icu-dev \
    oniguruma-dev \
    libxslt-dev

COPY ./src/composer.lock ./src/composer.json /var/www/html/

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install gd zip pdo pdo_mysql intl mbstring xsl opcache exif

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN rm -rf /var/cache/apk/*

EXPOSE 9000

CMD ["php-fpm"]
