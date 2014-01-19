require 'vagrant'
require "pseudomuto/plugin/version"

module Pseudomuto

  VAGRANT_PLUGIN_VERSION = "2"

  PLUGINS = [
    { name: 'vagrant-librarian-chef', version: '0.1.4' }
  ]

  class VagrantPlugin < Vagrant.plugin(VAGRANT_PLUGIN_VERSION)
    name 'vagrant-pseudomuto'
    description "Builds my personal development environment"

    command "bundle" do
      require_relative 'plugin/commands/bundle'
      Commands::Bundle
    end

    def self.initialize_test_environment
      require_relative 'plugin/commands/bundle'
    end
  end
end
