# How to use

## Quick start

1. Build and up containers
```
docker-compose build
docker-compose up -d
```
2. Open
http://localhost:8099/

3. Put yours project in "app" folder

## Databases

Adminer panel:
http://localhost:8080/
- System: MySQL
- Server: db
- User: root
- Pass: root

For Laravel **.env** file
```
...
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=database
DB_USERNAME=root
DB_PASSWORD=root
...
```

## Containers

You can work into php-fpm container and use **composer** and **git**.

1. Find out the name of the php-fpm container

```
Input:

docker ps
```
```
Output:

CONTAINER ID        IMAGE                                   COMMAND                  CREATED             STATUS              PORTS                    NAMES
c0cb369a9d53        docker-nginx-php-composer-setup_nginx   "nginx -g 'daemon of…"   33 minutes ago      Up 33 minutes       0.0.0.0:8099->80/tcp     docker-nginx-php-composer-setup_nginx_1
ef522233cd5e        docker-nginx-php-composer-setup_fpm     "docker-php-entrypoi…"   33 minutes ago      Up 33 minutes       9000/tcp                 docker-nginx-php-composer-setup_fpm_1
5746924b88ba        adminer                                 "entrypoint.sh docke…"   33 minutes ago      Up 33 minutes       0.0.0.0:8080->8080/tcp   docker-nginx-php-composer-setup_adminer_1
e46e0cb15ca4        mysql                                   "docker-entrypoint.s…"   33 minutes ago      Up 33 minutes       3306/tcp, 33060/tcp      docker-nginx-php-composer-setup_db_1

```

2 Execute bash
```
docker exec -it docker-nginx-php-composer-setup_fpm_1 bash
```

3. Now you can install Laravel:
```
cd /var/www/app
composer create-project --prefer-dist laravel/laravel ./
ln -s ./public/index.php index.php
```

4. Or clone your project from git
```
cd /var/www/app
git clone https://github.com/user/project.git .
```

## Problems?

If you have trouble with app folder permissions
```
sudo chown :1024 app \
&& sudo chmod 775 app \
&& sudo chmod g+s app \
&& sudo chown ubuntu app
```
