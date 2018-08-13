# source: https://github.com/phpearth/docker-php
FROM phpearth/php:7.2 as production

MAINTAINER Ondřej Václavík <ahoj@ondrejvaclavik.cz>

RUN apk --no-cache update && apk add --no-cache \
	# server
		nginx \
		runit \
	# php
		php7.2-fpm \
		php7.2-iconv \
		php7.2-json \
		php7.2-opcache \
		php7.2-pdo \
		php7.2-pdo_mysql \
		php7.2-session \
		php7.2-tokenizer \
	# clean up
	&& rm -rf /var/cache/apk/*

COPY docker/app/production/ /
COPY src /var/app

RUN chmod 755 /sbin/runit-wrapper.sh \
	&& chmod 755 /sbin/runsvdir-start.sh \
	&& chmod -R 755 /etc/service \
	&& chmod 777 /var/app/log \
	&& chmod 777 /var/app/temp

EXPOSE 80
EXPOSE 443

WORKDIR /var/app
VOLUME ["/var/www/html/log"]
CMD ["/sbin/runit-wrapper.sh"]

FROM production as development

RUN apk --no-cache add \
		make \
		php7.2 \
		php7.2-xdebug

COPY docker/app/development/ /
