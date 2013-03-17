require 'bundler/gem_tasks'
require 'rake/clean'
require 'rspec/core/rake_task'

CLEAN.include 'pkg'

RSpec::Core::RakeTask.new

task :default => :spec
task :test => :spec
