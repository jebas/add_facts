# spec/acceptance/entry_spec.rb

require 'spec_helper_acceptance'

describe 'add_facts entry' do
  before(:each) do 
        pp = <<-EOS
      add_facts::entry { 'fred':
        value => 'wilma',
      }
      add_facts::entry { 'barney':
        value => 'betty',
      }
    EOS
    apply_manifest(pp)
  end
  it 'should run with no errors' do
    pp = <<-EOS
      add_facts::entry { 'foo':
        value => 'bar',
      }
    EOS
    expect(apply_manifest(pp).exit_code).to_not eq(1)
    expect(apply_manifest(pp).exit_code).to eq(0)
  end
  describe file('/opt/puppetlabs/facter/facts.d/add_facts.txt') do
    its(:content) {should match /fred = wilma/}
    its(:content) {should match /barney = betty/}
  end
  it 'should remove facts' do
    pp = <<-EOS
      add_facts::entry { 'fred':
        value => 'wilma',
      }
      add_facts::entry { 'barney':
        value => 'betty',
      }
    EOS
    pp1 =<<-EOS
      add_facts::entry { 'barney':
        ensure => absent,
      }
    EOS
    apply_manifest(pp)
    expect(apply_manifest(pp1).exit_code).to_not eq(1)
    expect(apply_manifest(pp1).exit_code).to eq(0)
  end
end
