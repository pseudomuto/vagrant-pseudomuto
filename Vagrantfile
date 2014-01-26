# -*- mode: ruby -*-
# vi: set ft=ruby :

$:.unshift('lib')
require 'vagrant-pseudomuto'

Vagrant.configure("2") do |config|
  config.vm.provision :chef_solo do |chef|
    config.librarian_chef.cheffile_dir = '.vagrant/cookbooks'

    chef.cookbooks_path = [
      "#{config.librarian_chef.cheffile_dir}/cookbooks",
      "#{config.librarian_chef.cheffile_dir}/tmp/librarian/cookbooks"
    ]

    chef.roles_path     = "#{config.librarian_chef.cheffile_dir}/roles/dev"
  end
end
