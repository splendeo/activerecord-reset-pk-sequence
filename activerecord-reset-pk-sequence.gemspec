# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activerecord-reset-pk-sequence/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sergio Díaz"]
  gem.email         = ["sdiaz@splendeo.es"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activerecord-reset-pk-sequence"
  gem.require_paths = ["lib"]
  gem.version       = Activerecord::Reset::Pk::Sequence::VERSION
end
