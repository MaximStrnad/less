FROM alpine:3.7 as builder

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

COPY ./src /src
WORKDIR /src

RUN apk --update add ca-certificates \
    && echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories

RUN apk --no-cache add php7-fpm@php php7-iconv@php php7-json@php php7-mysqli@php \
    php7-opcache@php php7-openssl@php php7-pdo@php php7-session@php \
    # for composer
    php7@php php7-mbstring@php php7-phar@php php7-zlib@php \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --ignore-platform-reqs -a --no-dev --no-progress



FROM alpine:3.7

COPY docker/app/nginx.conf /etc/nginx/nginx.conf
COPY docker/app/fpm-pool.conf /etc/php7/php-fpm.d/zzz_custom.conf
COPY docker/app/php-prod.ini /etc/php7/conf.d/zzz_custom.ini
COPY docker/app/entrypoint.sh /entrypoint.sh
COPY --from=builder /etc/apk/keys/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
COPY --from=builder /src /var/www/html

RUN apk --update add ca-certificates \
    && echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories \
    && apk --no-cache add php7-fpm@php php7-iconv@php php7-json@php php7-mysqli@php \
       php7-opcache@php php7-openssl@php php7-pdo@php php7-session@php \
       nginx \
    && chmod 0777 /var/www/html/log \
    && chmod 0777 /var/www/html/temp \
    && chmod 755 /entrypoint.sh \
    && rm -rf /var/cache/apk/*

EXPOSE 80

WORKDIR /var/www/html
VOLUME ["/var/www/html/log"]
CMD ["/entrypoint.sh"]
