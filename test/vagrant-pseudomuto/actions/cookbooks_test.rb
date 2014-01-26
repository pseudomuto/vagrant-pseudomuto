require 'test_helper'

class CookbooksActionTest < Minitest::Test
  def setup
    app = mock('vagrant app')
    app.expects(:call)

    @action = Pseudomuto::VagrantPlugin::Actions::Cookbooks.new(app, nil)
  end

  def test_call_clones_cookbooks_when_not_installed
    @action.stubs(:cookbooks_installed?).returns(false)
    @action.expects(:clone_cookbooks).once

    @action.call({})
  end

  def test_call_updates_cookbooks_when_installed
    @action.stubs(:cookbooks_installed?).returns(true)
    @action.expects(:update_cookbooks).once

    @action.call({})
  end
end
