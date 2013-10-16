#!/usr/bin/env bash

#Mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get update
apt-get install mongodb-10gen -y
apt-get install nginx -y
apt-get install ruby -y


# Start Scripts
service mongodb start
service nginx start

# Start at boot
update-rc.d nginx defaults
