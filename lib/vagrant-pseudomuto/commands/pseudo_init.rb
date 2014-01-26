module Pseudomuto
  module VagrantPlugin
    module Commands
      class PseudoInit < Vagrant.plugin('2', :command)

        def execute
          vagrant_file = 'Vagrantfile'
          unless File.exists?(vagrant_file)
            File.write(vagrant_file, template)
          else
            puts "Vagrantfile already exists..."
          end
        end

        private

        def template
          code = <<TEMPLATE
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provision :chef_solo do |chef|
    config.librarian_chef.cheffile_dir = '.vagrant/cookbooks'

    chef.cookbooks_path = [
      "\#{config.librarian_chef.cheffile_dir}/cookbooks",
      "\#{config.librarian_chef.cheffile_dir}/tmp/librarian/cookbooks"
    ]

    chef.roles_path     = "\#{config.librarian_chef.cheffile_dir}/roles/dev"
  end
end
TEMPLATE
        end
      end
    end
  end
end
