# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lexhub/version'

Gem::Specification.new do |gem|
  gem.name          = "lexhub"
  gem.version       = Lexhub::VERSION
  gem.authors       = ["Joe Sak"]
  gem.email         = ["joe@joesak.com"]
  gem.description   = %q{Hi Haters}
  gem.summary       = %q{I'll do this in a bit okay}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'

  gem.add_dependency 'github_api'
end
