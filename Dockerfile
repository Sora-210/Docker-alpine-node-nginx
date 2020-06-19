FROM node:10.18.0-alpine

RUN apk update && \
    apk upgrade && \
    apk add nginx && \
    adduser -D -g 'www' www && \
    mkdir /www && \
    chown -R www:www /var/lib/nginx && \
    chown -R www:www /www && \
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig && \
    mkdir /run/nginx && \
    touch /run/nginx/nginx.pid

COPY ./files/nginx.conf /etc/nginx/
COPY ./files/index.html /www/

EXPOSE 80

ENTRYPOINT nginx -g 'daemon off;'