require 'rake/testtask'
require 'yaml'

task :default => [:test]

Rake::TestTask.new do |t|
  t.pattern = './test/**/[^_]*_test.rb'
end
