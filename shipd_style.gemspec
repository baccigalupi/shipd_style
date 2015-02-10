# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shipd_style/version'

Gem::Specification.new do |spec|
  spec.name          = "shipd_style"
  spec.version       = ShipdStyle::VERSION
  spec.authors       = ["Kane Baccigalupi"]
  spec.email         = ["kane@shipd.id"]
  spec.summary       = %q{Responsive Design CSS3 Compass Framework}
  spec.description   = %q{ShipdStyle is a compass driven CSS3 framework that makes building responsive designs easy, and extensible.}
  spec.homepage      = "https://github.com/shipd/shipd_style"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "compass"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
