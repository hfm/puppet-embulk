require 'beaker-rspec'

# Install Puppet agent on all hosts
install_puppet_on(hosts)
# install_puppet_agent_on(hosts, {})

# Install module to all hosts
module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
install_dev_puppet_module(:source => module_root)

# Install dependencies
hosts.each do |host|
  apply_manifest_on(host, 'package { "tar": }')

  on(host, puppet('module', 'install', 'puppetlabs-stdlib'))
  on(host, puppet('module', 'install', 'maestrodev-wget'))
end

RSpec.configure do |c|
  c.formatter = :documentation
end
