# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cvg/version'

Gem::Specification.new do |spec|
  spec.name          = "cvg"
  spec.version       = Cvg::VERSION
  spec.authors       = ["Seamus Abshere"]
  spec.email         = ["seamus@abshere.net"]
  spec.description   = %q{Like jq or grep for csv. Combine one or more CSVs while filtering on fields with regular expressions, whitelists, presence, missing, etc.}
  spec.summary       = %q{Like jq or grep for csv. Combine one or more CSVs while filtering on fields with regular expressions, whitelists, presence, missing, etc.}
  spec.homepage      = "https://github.com/seamusabshere/cvg"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "to_regexp"
  spec.add_runtime_dependency 'hash_digest'
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-expectations"
  spec.add_development_dependency "posix-spawn"
  spec.add_development_dependency "pry"
end
