#!/bin/bash
cd /var/www/

## Set permissions
chgrp -R www-data storage
#chgrp -R www-data storage bootstrap/cache
#chmod -R ug+rwx storage bootstrap/cache

## Copy .env
cp .envdocker/.env .env

## Install Laravel
composer install
php artisan key:generate
#php artisan migrate --seed