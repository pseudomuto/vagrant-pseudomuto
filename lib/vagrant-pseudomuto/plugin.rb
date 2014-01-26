require 'vagrant'
require 'vagrant-librarian-chef'

require_relative 'commands/bundle'
require_relative 'commands/pseudo_init'
require_relative 'actions/cookbooks'

module Pseudomuto
  module VagrantPlugin

    PLUGINS = [
      { name: 'vagrant-librarian-chef', version: '0.1.4' }
    ]

    class Plugin < Vagrant.plugin('2')
      name 'vagrant-pseudomuto'
      description "Builds my personal development environment"

      command 'bundle' do
        Commands::Bundle
      end

      command 'pseudo-init' do
        Commands::PseudoInit
      end

      action_hook 'cookbooks' do |hook|
        hook.before VagrantPlugins::LibrarianChef::Action::Install, Actions::Cookbooks
      end
    end
  end
end
