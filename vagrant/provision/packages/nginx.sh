#!/usr/bin/env bash

apt-get install -y nginx

info "Configure NGINX"
sed -i 's/user www-data/user vagrant/g' /etc/nginx/nginx.conf
cp /app/vagrant/etc/nginx/fastcgi_params /etc/nginx/fastcgi_params

info "Enabling site configuration"
ln -s /app/vagrant/etc/nginx/app.conf /etc/nginx/sites-enabled/app.conf

echo "Done!"