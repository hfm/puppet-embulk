# -*- mode: ruby -*-
# vi: set ft=ruby :

def platforms
  {
    centos5: 'puppetlabs/centos-5.11-64-puppet',
    centos6: 'puppetlabs/centos-6.6-64-puppet',
    centos7: 'puppetlabs/centos-7.2-64-puppet',
  }
end

Vagrant.configure(2) do |config|
  config.vm.provision :puppet do |puppet|
    puppet.environment_path = '.'
    puppet.environment      = 'example'
  end

  platforms.each do |dist, box|
    config.vm.define dist do |platform|
      platform.vm.box       = box
      platform.vm.host_name = dist
    end
  end
end
