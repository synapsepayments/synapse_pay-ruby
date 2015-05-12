$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'synapse_pay/version'

spec = Gem::Specification.new do |s|
  s.name = 'synapse_pay'
  s.summary = 'Ruby bindings for SynapsePay API'
  s.description = 'SynapsePay allows you to integrate bank payments into your applications'
  s.homepage = 'http://synapsepay.readme.io/v1.0/docs'
  s.authors = ['Apibits.com']
  s.email = ['libraries@apibits.com']
  s.version = SynapsePay::VERSION
  s.license = 'MIT'

  s.add_dependency('rest-client', '~> 1.4')
  s.add_dependency('mime-types', '>= 1.25', '< 3.0')
  s.add_dependency('json', '~> 1.8.1')

  s.add_development_dependency('mocha', '~> 0.13.2')
  s.add_development_dependency('shoulda', '~> 3.4.0')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('rake')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end

