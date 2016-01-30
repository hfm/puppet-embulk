require 'spec_helper'

describe 'embulk' do
  context 'with defaults for all parameters' do
    it { should compile }
    it { should compile.with_all_deps }
    it { should contain_class('embulk') }
  end

  describe 'supported os' do
    context 'redhat' do
      it { should compile }
    end

    context 'debian' do
      let(:facts) do
        { :operatingsystem => 'Debian' }
      end

      it { should compile }
    end

    context 'ubuntu' do
      let(:facts) do
        { :operatingsystem => 'Ubuntu' }
      end

      it { should compile }
    end
  end
end
