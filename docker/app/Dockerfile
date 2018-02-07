FROM alpine:3.7

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

COPY nginx.conf /etc/nginx/nginx.conf
COPY fpm-pool.conf /etc/php7/php-fpm.d/zzz_custom.conf
COPY php-dev.ini /etc/php7/conf.d/zzz_custom.ini
COPY entrypoint.sh /entrypoint.sh

RUN apk --update add ca-certificates \
	&& echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories \
	&& apk --no-cache add php7-fpm@php php7-iconv@php php7-json@php php7-mysqli@php \
		php7-opcache@php php7-openssl@php php7-pdo@php php7-session@php \
		# for composer
        php7@php php7-mbstring@php php7-phar@php php7-zlib@php \
		# server
        nginx \
	&& ln -s /usr/bin/php7 /usr/bin/php

RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 80

WORKDIR /var/www/html
VOLUME ["/var/www/html/log"]
CMD ["/entrypoint.sh"]
