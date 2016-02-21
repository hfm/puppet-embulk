require 'spec_helper_acceptance'

describe 'embulk class' do
  let(:manifest) {
    <<-EOS
      class { '::embulk': ensure => latest }

      ::embulk::plugin {
        'embulk-parser-ltsv':
          ensure => present;

        'embulk-output-bigquery':
          ensure => latest;
      }
    EOS
  }

  it 'should work without errors' do
    result = apply_manifest(manifest, :acceptable_exit_codes => [0, 2], :catch_failures => true)
    expect(result.exit_code).not_to eq 4
    expect(result.exit_code).not_to eq 6
  end

  it "should run a second time without changes" do
    result = apply_manifest(manifest)
    expect(result.exit_code).to eq 0
  end

  describe file('/root/.embulk/bin/embulk') do
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  describe command('/root/.embulk/bin/embulk gem list --local') do
    its(:stdout) { should match /^embulk-parser-ltsv\s+\(.+\)$/ }
    its(:stdout) { should match /^embulk-output-bigquery\s+\(.+\)$/ }
  end
end
