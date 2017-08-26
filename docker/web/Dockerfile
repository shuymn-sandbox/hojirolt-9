FROM nginx:alpine

MAINTAINER shuymn <mail@shuymn.me>

COPY ./ /var/www/
COPY ./docker/web/sites/default.conf /etc/nginx/sites-available/

ADD ./docker/web/nginx.conf /etc/nginx/

ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

RUN echo "upstream php-upstream { server ${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443
