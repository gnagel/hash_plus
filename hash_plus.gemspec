# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hash_plus"

Gem::Specification.new do |gem|
  gem.name          = "hash_plus"
  gem.version       = '1.2'
  gem.authors       = ["Glenn Nagel"]
  gem.email         = ["glenn@mercury-wireless.com"]
  gem.homepage      = "https://github.com/gnagel/hash_plus"
  gem.summary       = %q{Handy extensions to the Ruby Hash class}
  gem.description   = %q{Extensions to the Hash class for checking form input}
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib", "tasks"]
end
