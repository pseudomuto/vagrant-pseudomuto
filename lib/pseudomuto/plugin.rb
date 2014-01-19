require 'vagrant'
require "pseudomuto/plugin/version"

begin
require "vagrant-librarian-chef"
rescue LoadError
end

module Pseudomuto

  VAGRANT_PLUGIN_VERSION = "2"

  PLUGINS = [
    { name: 'vagrant-librarian-chef', version: '0.1.4' }
  ]

  class VagrantPlugin < Vagrant.plugin(VAGRANT_PLUGIN_VERSION)
    name 'vagrant-pseudomuto'
    description "Builds my personal development environment"

    action_hook 'cookbooks' do |hook|
      require_relative 'plugin/actions/cookbooks'
      if defined?(VagrantPlugins::LibrarianChef::Action::Install)
        hook.before VagrantPlugins::LibrarianChef::Action::Install, Plugin::Actions::Cookbooks
      end
    end

    command "bundle" do
      require_relative 'plugin/commands/bundle'
      Plugin::Commands::Bundle
    end

    def self.initialize_test_environment
      require_relative 'plugin/commands/bundle'
      require_relative 'plugin/actions/cookbooks'
    end
  end
end
