# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'svmlightcli/version'

Gem::Specification.new do |spec|
  spec.name          = "svmlightcli"
  spec.version       = Svmlightcli::VERSION
  spec.authors       = ["Hossam Hammady"]
  spec.email         = ["github@hammady.net"]

  spec.summary       = %q{svm_light command line gem wrapper offering svm_learn and svm_classify}
  spec.description   = %q{This is a convenience gem wrapper for the svm_light command line binaries (svm_learn and svm_classify). No Ruby interfaces.}
  spec.homepage      = "https://github.com/hammady/svmlightcli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["svm_learn", "svm_classify"]
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/svmlightcli/extconf.rb"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
end
