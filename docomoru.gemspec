lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "docomoru/version"

Gem::Specification.new do |spec|
  spec.name          = "docomoru"
  spec.version       = Docomoru::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "Client library for docomo API written in Ruby."
  spec.homepage      = "https://github.com/r7kamura/docomoru"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "json"
  spec.add_dependency "rack"
  spec.add_dependency "slop"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "codeclimate-test-reporter", "0.4.4"
  spec.add_development_dependency "rake", "10.4.2"
  spec.add_development_dependency "rspec", "3.2.0"
  spec.add_development_dependency "rubocop", "0.29.1"
  spec.add_development_dependency "webmock", "1.20.4"
end
