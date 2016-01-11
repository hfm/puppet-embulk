require 'spec_helper'

describe 'embulk' do
  context 'with defaults for all parameters' do
    it { should compile }
    it { should compile.with_all_deps }
    it { should contain_class('embulk') }
  end
end
