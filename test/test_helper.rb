require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/mini_test'

require_relative '../lib/pseudomuto/plugin'
Pseudomuto::VagrantPlugin.initialize_test_environment
