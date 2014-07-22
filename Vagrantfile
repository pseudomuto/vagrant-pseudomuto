# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_IP = '192.168.211.39'

$:.unshift('lib')
require 'vagrant-pseudomuto'

Vagrant.configure("2") do |config|
  config.vm.box      = 'chef/ubuntu-14.04'
  config.vm.box_url  = 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/vmware/opscode_ubuntu-14.04_chef-provisionerless.box'
  config.vm.hostname = 'pseudomuto.dev'
  config.vm.network :private_network, ip: VAGRANT_IP

  config.ssh.forward_agent = true
  config.omnibus.chef_version = :latest

  config.vm.provider :vmware_fusion do |box|
    box.vmx["memsize"] = "4096"
    box.vmx["numvcpus"] = "2"
  end

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
