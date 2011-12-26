# -*- encoding: utf-8 -*-
require File.expand_path('../lib/facebook_dialog/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Pickett"]
  gem.email         = ["dpickett@enlightsolutions.com"]
  gem.description   = %q{A utility for building progressively enhanced Facebook dialogs}
  gem.summary       = %q{Use ActiveModel serialization to keep html and javascript FB dialogs DRY}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "facebook_dialog"
  gem.require_paths = ["lib"]
  gem.version       = FacebookDialog::VERSION

  gem.add_dependency "rack"
  gem.add_dependency "activemodel"
  gem.add_dependency "activesupport"
  gem.add_dependency "configatron"
  gem.add_dependency "rake"

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "omniauth-facebook"
end

