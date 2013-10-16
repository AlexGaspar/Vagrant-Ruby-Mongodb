#!/usr/bin/env bash

#Mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get update
apt-get install make
apt-get install mongodb-10gen -y
apt-get install nginx -y

wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz
tar -xvzf ruby-2.0.0-p247.tar.gz 
cd ./ruby-2.0.0-p247
./configure --prefix=/usr/local
make
make install
# Start Scripts
service mongodb start
service nginx start

# Start at boot
update-rc.d nginx defaults
