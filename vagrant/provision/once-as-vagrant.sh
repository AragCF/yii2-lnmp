#!/usr/bin/env bash

function info {
  echo " "
  echo "--> $1"
  echo " "
}

if [ ! -d /app/project ]; then
	mkdir /app/project
fi
rm -R /app/project/*	
cd /app/project

info "Create yii project"
composer create-project --prefer-dist yiisoft/yii2-app-advanced ./

info "Install vendors"
composer install

info "Project initialization"
php ./init --env=Development --overwrite=y