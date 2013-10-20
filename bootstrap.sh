#!/usr/bin/env bash

#Mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

# Installs
apt-get update
apt-get install python-software-properties python g++ -y
apt-get install vim -y
apt-get install curl -y
apt-get install mongodb-10gen -y
apt-get install nginx -y

# Nodejs
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install nodejs -y

# Ruby
\curl -L https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm requirements
rvm install ruby
rvm use ruby --default
rvm rubygems current

# Setup nginx
ln -fs /vagrant /var/www
cp /vagrant/default.nginx /etc/nginx/sites-available

# GEMs
gem install sinatra --no-ri --no-rdoc
gem install thin --no-ri --no-rdoc
gem install mongoid --no-ri --no-rdoc

# Start services
service mongodb restart
service nginx restart

# Boot
update-rc.d nginx defaults

# Add vagrant to rvm
usermod -a -G rvm vagrant
