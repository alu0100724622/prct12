#Rakefile


$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec', './test'

require 'rspec/core/rake_task'
require "bundler/gem_tasks"

RSpec::Core::RakeTask.new
task :default => :spec
 
desc "instalando gemas"
task :install do
        sh "bundle install"
end
