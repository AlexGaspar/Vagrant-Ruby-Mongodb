# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "RubyBox"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.provision :shell, :path => "bootstrap.sh"
  
  config.vm.synced_folder "/home/alex/ruby/api", "/vagrant"

  config.vm.network :private_network, ip: "10.0.0.2", id: 'private_network'
  config.vm.network :public_network, id: 'private_network'
end
