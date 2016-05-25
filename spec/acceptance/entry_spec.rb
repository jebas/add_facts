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
      add_facts::entry { 'bambam':
        value => 'pebbles',
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
  describe file('/opt/puppetlabs/facter/facts.d/add_facts.yaml') do
    its(:content) {should match /fred: wilma/}
    its(:content) {should match /barney: betty/}
  end
  context 'should remove facts' do
    before(:each) do
      pp = <<-EOS
        add_facts::entry { 'fred': 
          ensure => absent,
        }
      EOS
      apply_manifest(pp)
    end
    it 'without errors' do
      pp =<<-EOS
        add_facts::entry { 'barney':
          ensure => absent,
        }
      EOS
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end
    describe file('/opt/puppetlabs/facter/facts.d/add_facts.yaml') do
      its(:content) {should_not match /fred:/}
    end
  end
end
