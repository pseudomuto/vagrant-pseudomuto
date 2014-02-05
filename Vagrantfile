# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_IP = '192.168.211.39'

$:.unshift('lib')
require 'vagrant-pseudomuto'

Vagrant.configure("2") do |config|
  config.vm.box = 'shopify-precise64'
  config.vm.box_url = 'http://shopify-vagrant.s3.amazonaws.com/ubuntu-12.04_vmware.box'

  config.vm.hostname = 'pseudomuto.dev'
  config.vm.network :private_network, ip: VAGRANT_IP

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder 'src', '/home/vagrant/src', nfs: true

  config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    config.librarian_chef.cheffile_dir = '.vagrant/cookbooks'

    chef.cookbooks_path = [
      "#{config.librarian_chef.cheffile_dir}/cookbooks",
      "#{config.librarian_chef.cheffile_dir}/tmp/librarian/cookbooks"
    ]

    chef.roles_path = "#{config.librarian_chef.cheffile_dir}/roles"
    chef.add_role 'pseudomuto'
  end
end
