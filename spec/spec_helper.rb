require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.default_facts = {
    osfamily: 'Debian',
    operatingsystem: 'Debian',
    kernel: 'Linux',
    architecture: 'x86_64',
    lsbdistcodename: 'stretch',
  }

end
