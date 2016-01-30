require 'spec_helper'

describe 'embulk::java' do
  context 'redhat' do
    it { should contain_package('java-1.7.0-openjdk') }
  end

  context 'debian' do
    let(:facts) do
      { :operatingsystem => 'Debian' }
    end

    it { should contain_package('openjdk-7-jre-headless') }
  end

  context 'ubuntu' do
    let(:facts) do
      { :operatingsystem => 'Ubuntu' }
    end

    it { should contain_package('openjdk-7-jre-headless') }
  end
end
