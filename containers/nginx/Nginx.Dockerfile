FROM nginx
WORKDIR /var/www
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
