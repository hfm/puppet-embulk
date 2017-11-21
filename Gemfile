source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 4.9']
gem 'puppet', puppetversion

group :test, :development do
  gem 'puppetlabs_spec_helper'
  gem 'puppet-lint'
  gem 'facter'
  gem 'metadata-json-lint'
  gem 'librarian-puppet'
end

group :development do
  gem 'puppet-blacksmith'
end

group :system_tests do
  gem 'beaker-rspec'
end
