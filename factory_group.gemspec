# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory_group/version'

Gem::Specification.new do |spec|
  spec.name          = "factory_group"
  spec.version       = FactoryGroup::VERSION
  spec.authors       = ["Yuvaraja Balamurugan"]
  spec.email         = ["yuv.slm@gmail.com"]
  spec.summary       = %q{Lets you create a group of factories}
  spec.description   = %q{Lets you create a group of factories which can be accessed from your specs}
  spec.homepage      = "http://codebrahma.com/factory_group/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "factory_girl", ">= 4.4.0"

  spec.add_development_dependency "rspec", ">= 2.13.0"
  spec.add_development_dependency "bundler", ">= 1.6"
  spec.add_development_dependency "rake", ">= 10.3.1"
  spec.add_development_dependency "debugger"
  spec.add_development_dependency "simplecov", "~> 0.9.0"
end
