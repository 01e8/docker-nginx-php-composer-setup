# docker-nginx-php-composer-setup

```
docker-compose build
docker-compose up -d
```

```
sudo chown :1024 app
sudo chmod 775 app
sudo chmod g+s app
sudo chown ubuntu app
```

app/index.php

```
docker exec -it docker-nginx-php-composer-setup_fpm_1 bash
cd /var/www/app
composer create-project --prefer-dist laravel/laravel ./
ln -s ./public/index.php index.php
```
