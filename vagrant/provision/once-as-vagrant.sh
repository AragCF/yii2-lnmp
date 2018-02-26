#!/usr/bin/env bash

if [ ! -d /app/project ]; then
	mkdir /app/project
fi	
cd /app/project

info "Create yii project"
composer create-project --prefer-dist yiisoft/yii2-app-advanced ./

info "Install vendors"
composer install

info "Project initialization"
./init --env 0