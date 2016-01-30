source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'puppet', puppetversion

group :test, :development do
  gem 'puppetlabs_spec_helper', '>= 0.8.2'
  gem 'puppet-lint', '>= 1.0.0'
  gem 'facter', '>= 1.7.0'
  gem 'metadata-json-lint'
  gem 'librarian-puppet'
  gem 'puppet-blacksmith'
end

group :system_tests do
  gem 'beaker'
  gem 'beaker-rspec'
end
