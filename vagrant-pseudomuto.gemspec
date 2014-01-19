# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pseudomuto/plugin/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-pseudomuto"
  spec.version       = Pseudomuto::Plugin::VERSION
  spec.authors       = ["pseudomuto"]
  spec.email         = ["david.muto@gmail.com"]
  spec.summary       = %q{My personal vagrant plugin}
  spec.description   = %q{Quickly get vagrant machines up and running.}
  spec.homepage      = "https://github.com/pseudomuto/vagrant-pseudomuto"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
