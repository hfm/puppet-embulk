require 'spec_helper'

describe 'embulk' do
  context 'with defaults for all parameters' do
    it { should compile }
    it { should compile.with_all_deps }
    it { should contain_class('embulk') }
  end

  context 'dependencies' do
    it { should contain_package('java-1.7.0-openjdk') }
  end
end
