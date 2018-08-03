require 'spec_helper'

describe 'embulk' do
  context 'redhat' do
    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('embulk') }
  end

  context 'debian' do
    let(:facts) do
      { osfamily: 'Debian' }
    end

    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('embulk') }
  end
end
