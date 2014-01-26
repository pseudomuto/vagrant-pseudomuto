require 'test_helper'

class PseudoInitCommandTest < Minitest::Test
  def setup
    @command = Pseudomuto::VagrantPlugin::Commands::PseudoInit.new(nil, nil)
  end

  def test_creates_vagrantfile_when_not_found
    File.stubs(:exists?).returns(false)
    File.expects(:write).with('Vagrantfile', anything).once

    @command.execute
  end

  def test_tells_user_when_vagrantfile_already_exiata
    File.stubs(:exists?).returns(true)

    output, _ = capture_io do
      @command.execute
    end

    assert_equal 'Vagrantfile already exists...', output.chomp
  end
end
