#!/usr/bin/env bash

#Mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

# Installs
apt-get update
apt-get install make
apt-get install vim -y
apt-get install mongodb-10gen -y
apt-get install nginx -y

# Ruby
if [[ "$(ruby -v)" != *2.0* ]]
then
    wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz
    tar -xvzf ruby-2.0.0-p247.tar.gz 
    cd ./ruby-2.0.0-p247
    ./configure --prefix=/usr/local
    make
    make install
fi

# Setup nginx
ln -fs /vagrant_data /var/www
mv /vagrant_data/default /etc/nginx/sites-available

# Start services
service mongodb start
service nginx restart

# Boot
update-rc.d nginx defaults

# Clean Up
cd /home/vagrant 
rm ruby* -rf
