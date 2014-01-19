require 'test_helper'

class PluginTest < Minitest::Test
  def setup
    @plugin = Pseudomuto::VagrantPlugin
  end

  def test_defines_metadata
    assert_equal 'vagrant-pseudomuto', @plugin.name
    refute_nil @plugin.description
    refute_empty @plugin.description
  end

  def test_exposes_bundle_command
    assert_includes @plugin.components.commands.keys, :bundle
  end
end
