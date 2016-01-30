source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'puppet', puppetversion

group :test, :development do
  gem 'puppetlabs_spec_helper', '>= 0.8.2'
  gem 'puppet-lint', '>= 1.0.0'
  gem 'facter', '>= 1.7.0'
  gem 'metadata-json-lint'

  if RUBY_VERSION < '1.9'
    gem 'i18n', '~> 0.6.11'
    gem 'activesupport', '~> 3.2'
    gem 'rspec', '~> 3.1.0'
    gem 'beaker', '~> 2.0'
    gem 'librarian-puppet', '~> 1.5'
  else
    gem 'librarian-puppet'
    gem 'beaker'
  end

  gem 'beaker-rspec'
  gem 'puppet-blacksmith'
end
