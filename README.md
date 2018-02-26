# Debian/Linux + Nginx + MariaDB + PHP 7

## Based on

https://app.vagrantup.com/debian/boxes/stretch64
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
end
```

## Configure
* cp ./vagrant/config/vagrant-local.example.yml ./vagrant/config/vagrant-local.yml
* nano ./vagrant/config/vagrant-local.yml

### Vagrantfile
```yaml
# Your personal GitHub token
github_token: <your-personal-github-token>
# Read more: https://github.com/blog/1509-personal-api-tokens
# You can generate it here: https://github.com/settings/tokens

# Guest OS timezone
timezone: Europe/London

# Are we need check box updates for every 'vagrant up'?
box_check_update: false

# Virtual machine name
machine_name: yii2-lnmp

# Virtual machine IP
ip: 192.168.100.100

# Virtual machine CPU cores number
cpus: 1

# Virtual machine RAM
memory: 1024
```

## Include

* Nginx
* PHP
* MariaDB
* Elasticsearch
