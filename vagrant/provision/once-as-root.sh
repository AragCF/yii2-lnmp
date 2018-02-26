#!/usr/bin/env bash

cd /app

timezone=$(echo "$1")

export REMOTE_IP=$(ip addr show eth1 | grep -oP 'inet \K\S[0-9.]+')

function info {
  echo " "
  echo "--> $1"
  echo " "
}

export DEBIAN_FRONTEND=noninteractive

info "Configure timezone"
timedatectl set-timezone ${timezone} --no-ask-password

info "Update OS software"
apt-get update
apt-get upgrade -y

info "Install core components"
apt-get install -y unzip mc curl wget git redis-server mailutils 

info "Install development components"
apt-get install -y autoconf automake libtool m4 libevent-2.0-5 libevent-core-2.0-5 libevent-extra-2.0-5 libevent-openssl-2.0-5 libevent-pthreads-2.0-5 libevent-dev

info "install packages"
for file in `find /app/vagrant/provision/packages -type f | sort -n`
do
	if [[ $file =~ .*\.sh$ ]]; then
		info "Install ${file}"
		. "${file}"
	fi
done

addgroup vagrant www-data
