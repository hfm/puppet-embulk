require 'spec_helper'

describe 'embulk' do
  context 'redhat' do
    it { should compile }
    it { should compile.with_all_deps }
    it { should contain_class('embulk') }
  end

  context 'debian' do
    let(:facts) do
      { :osfamily => 'Debian' }
    end

    it { should compile }
    it { should compile.with_all_deps }
    it { should contain_class('embulk') }
  end
end
