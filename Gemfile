source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in language_server-protocol.gemspec
gemspec

gem "benchmark-ips"
gem "pry-byebug"
current_ruby_version = Gem::Version.new(RUBY_VERSION)

if current_ruby_version < Gem::Version.new("2.7.0")
  gem "concurrent-ruby", "1.3.7"
end

if current_ruby_version < Gem::Version.new("3.1.0")
  gem "power_assert", "< 3.0"
end

if current_ruby_version >= Gem::Version.new("4.0.0")
  gem "fiddle"
end

if current_ruby_version < Gem::Version.new("2.7.0")
  gem "activesupport", "< 8.1.4"
elsif current_ruby_version < Gem::Version.new("3.1.0")
  gem "activesupport", "< 8.1.4"
elsif current_ruby_version < Gem::Version.new("3.2.0")
  gem "activesupport", "< 8.1.4"
else
  gem "activesupport"
end
gem "steep", require: false
