# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "language_server/protocol/version"

Gem::Specification.new do |spec|
  spec.name          = "language_server-protocol"
  spec.version       = LanguageServer::Protocol::VERSION
  spec.authors       = ["Fumiaki MATSUSHIMA"]
  spec.email         = ["mtsmfm@gmail.com"]

  spec.summary       = %q{A Language Server Protocol SDK}
  spec.description   = %q{A Language Server Protocol SDK}
  spec.homepage      = "https://github.com/mtsmfm/language_server-protocol-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z lib sig LICENSE.txt README.md`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_development_dependency "bundler", ">= 2.0.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-power_assert"
  spec.add_development_dependency "m"
  spec.add_development_dependency "activesupport"
end
