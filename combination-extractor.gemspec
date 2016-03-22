# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'combination_extractor'

Gem::Specification.new do |spec|
  spec.name          = 'combination-extractor'
  spec.version       = CombinationExtractor::VERSION
  spec.authors       = ['Hiroki Akiyama']
  spec.email         = ['akiyama@akiroom.com']

  spec.summary       = 'Exctract array to combination hash list.'
  spec.description   = 'Exctract array to combination hash list.'
  spec.homepage      = 'https://github.com/akiroom/combination-extractor'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
