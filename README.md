#Vagrant Ruby + MongoDB
Vagrant dev box to get an up and running Ruby + MongoDB environment. 

the root of the local directory is sync with /vagrant and it's also the root directory of nginx. 

##Included :
  * Ubuntu 12.04 64bits
  * nginx
  * rvm
  * Ruby
  * Mongodb
  * node.js
  * npm
  * Sinatra gem
  * Thin gem

##Network

There are actually 2 options to contact the VM :
  * via the private network with the IP address 10.0.0.2
  * via the public network, IP can be found with ip addr command

##Launch the server

```sh
ruby application.rb
```
