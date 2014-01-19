require 'test_helper'

class BundleCommandTest < MiniTest::Test
  def setup
    @command = Pseudomuto::Plugin::Commands::Bundle.new(nil, nil)
  end

  def test_installs_plugins
    @command.stubs(:installed_plugins).returns('')

    Pseudomuto::PLUGINS.each do |plugin|
      @command.stubs(:install).with(plugin[:name], plugin[:version]).once
    end

    @command.execute
  end

  def test_skips_installed_plugins
    plugins = Pseudomuto::PLUGINS.map do |plugin|
      "#{plugin[:name]} (#{plugin[:version]})"
    end

    @command.stubs(:installed_plugins).returns(plugins.join("\n"))
    @command.stubs(:system).never
    @command.execute
  end
end
