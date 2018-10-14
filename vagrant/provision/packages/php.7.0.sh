#!/usr/bin/env bash

apt-get install -y php7.0-curl php7.0-cli php7.0-intl php7.0-mysqlnd php7.0-pgsql php7.0-gd php7.0-fpm php7.0-mbstring php7.0-xml php-geoip php-zip php7.0-dev pkg-config php-xdebug

mkdir /var/log/php7-fpm

info "Configure PHP-FPM"
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /etc/php/7.0/fpm/php.ini
sed -i 's/user = www-data/user = vagrant/g' /etc/php/7.0/fpm/pool.d/www.conf
sed -i 's/group = www-data/group = vagrant/g' /etc/php/7.0/fpm/pool.d/www.conf
sed -i 's/owner = www-data/owner = vagrant/g' /etc/php/7.0/fpm/pool.d/www.conf

info "Configure xdebug"
cp /app/vagrant/etc/php/xdebug.ini /etc/php/7.0/mods-available/xdebug.ini
sed -i "s/xdebug.remote_host=10.0.0.1;/xdebug.remote_host=${REMOTE_IP};/g" /etc/php/7.0/mods-available/xdebug.ini

info "Configure pear"
pear config-set php_suffix 7.0

info "Install pecl extensions"
printf "\n" | pecl install event
echo "extension=event.so" > /etc/php/7.0/mods-available/event.ini
ln -s /etc/php/7.0/mods-available/event.ini /etc/php/7.0/fpm/conf.d/20-event.ini
ln -s /etc/php/7.0/mods-available/event.ini /etc/php/7.0/cli/conf.d/20-event.ini

info "Install composer"
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

echo "Done!"