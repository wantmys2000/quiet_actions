# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quiet_actions/version'

Gem::Specification.new do |gem|
  gem.name          = "quiet_actions"
  gem.version       = QuietActions::VERSION
  gem.authors       = ["Steven Buxton"]
  gem.email         = ["want_my_s2000@hotmail.com"]
  gem.description   = "Hides logging from certain actions"
  gem.summary       = "Hides logging from certain actions"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'railties', '>= 3.2', '< 5.0'
end
