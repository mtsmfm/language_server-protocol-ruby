$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'bundler'

active_support_spec = Bundler.definition.specs.find { |spec| spec.name == "activesupport" }
require "logger" if active_support_spec && active_support_spec.version < Gem::Version.new("7.1.0")

Bundler.require(:default, :development)

require "minitest/autorun"
