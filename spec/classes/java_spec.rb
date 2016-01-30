require 'spec_helper'

describe 'embulk::java' do
  context 'redhat' do
    it { should contain_package('java-1.7.0-openjdk') }
  end

  context 'debian' do
    let(:facts) do
      { :osfamily => 'Debian' }
    end

    it { should contain_package('openjdk-7-jre-headless') }
  end
end
