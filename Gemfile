source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in language_server-protocol.gemspec
gemspec

gem "benchmark-ips"
gem "pry-byebug"
current_ruby_version = Gem::Version.new(RUBY_VERSION)

if current_ruby_version < Gem::Version.new("2.7.0")
  gem "concurrent-ruby", "1.3.8"
end

if current_ruby_version < Gem::Version.new("3.1.0")
  gem "power_assert", "< 3.0"
end

# activesupport < 8.1 passes the `quirks_mode` option to JSON.generate, which
# json 3.0 rejects with ArgumentError. Rubies older than 3.2 cannot use
# activesupport 8.1, so keep them on json 2.x.
if current_ruby_version < Gem::Version.new("3.2.0")
  gem "json", "< 3.1"
end

if current_ruby_version >= Gem::Version.new("4.0.0")
  gem "fiddle"
end

gem "activesupport"
gem "steep", require: false
