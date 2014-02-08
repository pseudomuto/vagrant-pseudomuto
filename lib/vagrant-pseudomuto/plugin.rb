require 'vagrant'
require 'vagrant-librarian-chef'

require_relative 'commands/bundle'
require_relative 'commands/pseudo_init'
require_relative 'actions/cookbooks'
require_relative 'actions/machine_setup'
require_relative 'actions/ssh_config'

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

      action_hook 'machine_setup' do |hook|
        hook.before Vagrant::Action::Builtin::Provision, Actions::MachineSetup
      end

      action_hook "ssh-config" do |hook|
        hook.before Vagrant::Action::Builtin::Provision, Actions::SSHConfig
      end
    end
  end
end
