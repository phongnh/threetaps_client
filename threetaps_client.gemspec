# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'threetaps_client/version'

Gem::Specification.new do |spec|
  spec.name          = "threetaps_client"
  spec.version       = ThreetapsClient::VERSION
  spec.authors       = ["Phong Nguyen"]
  spec.email         = ["nhphong1406@gmail.com"]
  spec.summary       = %q{Ruby Client for 3taps API}
  spec.description   = %q{A very simple Rest Client for 3taps API.}
  spec.homepage      = "http://github.com/phongnh/threetaps_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.3.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency "json"
  spec.add_dependency "rest-client", "~> 1.6.7"
  spec.add_dependency "mime-types",  "~> 1.25.1"
end
