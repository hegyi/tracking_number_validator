# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tracking_number_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "tracking_number_validator"
  spec.version       = TrackingNumberValidator::VERSION
  spec.authors       = ["Adam Hegyi"]
  spec.email         = ["a.hegyi@vdm-vsg.de"]
  spec.description   = %q{Validator for DHL and FedEx Ground tracking numbers}
  spec.summary       = %q{Validator for DHL and FedEx Ground tracking numbers}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
