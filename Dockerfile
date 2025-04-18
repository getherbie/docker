ARG PHP_VERSION=8.3

FROM composer:lts AS composer

FROM php:$PHP_VERSION-cli

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        libicu-dev \
        libfreetype-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        unzip \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd intl

RUN pecl channel-update pecl.php.net \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN groupadd -g 1000 herbie && useradd -m -u 1000 -g herbie herbie
RUN mkdir /app  && chown -R herbie:herbie /app
USER herbie

WORKDIR /app
VOLUME /app

EXPOSE 8888

CMD ["php", "-S", "0.0.0.0:8888", "-t", "/app/web"]
