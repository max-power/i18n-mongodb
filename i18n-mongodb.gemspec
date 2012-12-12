# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "i18n-mongodb"
  gem.version       = "0.0.2"
  gem.authors       = ["Kevin"]
  gem.email         = ["kevin.melchert@gmail.com"]
  gem.description   = %q{I18n MongoDB backend}
  gem.summary       = %q{I18n MongoDB backend. Allows to store translations in a Mongo database, e.g. for providing a web-interface for managing translations.}
  gem.homepage      = "https://github.com/max-power/i18n-mongodb"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "i18n"
  gem.add_dependency "mongo", "~>1.8"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "turn"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency 'test_declarative'
end
