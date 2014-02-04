lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'juncture/version'

Gem::Specification.new do |spec|
  spec.name         = 'juncture'
  spec.summary      = 'Simple state object'
  spec.description  = 'A State object that can be queried'
  spec.homepage     = 'http://benslaughter.github.io/juncture/'
  spec.version      = Juncture::VERSION
  spec.date         = Juncture::DATE
  spec.license      = 'MIT'

  spec.author       = 'Ben Slaughter'
  spec.email        = 'b.p.slaughter@gmail.com'

  spec.files        = ['README.md', 'LICENSE']
  spec.files        += Dir.glob("lib/**/*.rb")
  spec.files        += Dir.glob("spec/**/*")
  spec.test_files   = Dir.glob("spec/**/*")
  spec.require_path = 'lib'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rspec'
end