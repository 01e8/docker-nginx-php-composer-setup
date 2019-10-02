# docker-nginx-php-composer-setup

```
docker-compose build
docker-compose up -d
```

Output:
```
Creating docker-nginx-php-composer-setup_db_1      ... done
Creating docker-nginx-php-composer-setup_adminer_1 ... done
Creating docker-nginx-php-composer-setup_fpm_1     ... done
Creating docker-nginx-php-composer-setup_nginx_1   ... done
```
Remember container name of fpm service for using composer
**docker-nginx-php-composer-setup_fpm_1**

```
sudo chown :1024 app \
&& sudo chmod 775 app \
&& sudo chmod g+s app \
&& sudo chown ubuntu app
```
http://localhost:8099/

```
docker exec -it docker-nginx-php-composer-setup_fpm_1 bash
cd /var/www/app
composer create-project --prefer-dist laravel/laravel ./
ln -s ./public/index.php index.php
```
