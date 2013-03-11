# -*- encoding: utf-8 -*-
require File.expand_path('../lib/majek/version', __FILE__)

Gem::Specification.new do |s|
  s.authors       = ['Mathias Lafeldt']
  s.email         = ['mathias.lafeldt@gmail.com']
  s.description   = %q{A preprocessor for Jekyll/Octopress blog posts that helps you to concentrate on writing}
  s.summary       = s.description
  s.homepage      = 'http://mlafeldt.github.com/majek'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.name          = 'majek'
  s.require_paths = ['lib']
  s.version       = Majek::VERSION

  s.add_dependency 'md_inc', '>= 0.2.9'
  s.add_development_dependency 'rake'
end
