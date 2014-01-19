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

  def test_defines_cookbooks_action_hook
    refute_equal 0, @plugin.components.action_hooks[:__all_actions__].size
  end
end
