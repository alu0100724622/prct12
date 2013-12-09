=begin
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matriznyj/version'

Gem::Specification.new do |spec|
  spec.name          = "matriznyj"
  spec.version       = Matriznyj::VERSION
  spec.authors       = ["Noelia"]
  spec.email         = ["alu0100724622@ull.edu.es"]
  spec.description   = %q{Esqueleto de una gema: Write a gem description}
  spec.summary       = %q{{Esqueleto de una gema: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
=end

$:.push File.expand_path("../lib", __FILE__)
require "matriznyj/version"

Gem::Specification.new do |s|
  s.name        = "matriznyj"
  s.version     = Matriznyj::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Noelia Rodriguez y Juan Manuel Ramos"]
  s.email       = ["alu0100724622@ull.edu.es"]
  s.homepage    = ""
  s.summary     = %q{matriz}
  s.description = %q{matriz}

  s.rubyforge_project = "matriznyj"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
