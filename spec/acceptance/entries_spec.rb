# spec/aceptance/entry_spec.rb

require 'spec_helper_acceptance'

describe 'add_facts entries' do 
  it 'should run without errors' do
    pp = <<-EOS
      class { 'add_facts::entries': }
    EOS
    expect(apply_manifest(pp).exit_code).to_not eq(1)
    expect(apply_manifest(pp).exit_code).to eq(0)
  end
  describe file('/opt/puppetlabs/facter/facts.d/add_facts.yaml') do
    its(:content) {should match /lucy: ricki/}
    its(:content) {should match /ethel: fred/}
  end
end
