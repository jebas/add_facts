# spec/acceptance/class_spec.rb

require 'spec_helper_acceptance'

describe 'add_facts class' do
  it 'should install with no errors' do
    pp = <<-EOS
      class { 'add_facts': }
    EOS
    expect(apply_manifest(pp).exit_code).to_not eq(1)
    expect(apply_manifest(pp).exit_code).to eq(0)
  end
  it 'should accept a new directory without error' do
    pp = <<-EOS
      class { 'add_facts': 
        directory => '/tmp'
      }
    EOS
    expect(apply_manifest(pp).exit_code).to_not eq(1)
    expect(apply_manifest(pp).exit_code).to eq(0)
  end
  describe 'directory' do
    before(:each) do
      pp = <<-EOS
        class { 'add_facts': 
          directory => '/tmp'
        }
        add_facts::entry { 'gizmo':
          value => 'dino',
        }
      EOS
      apply_manifest(pp)
    end
    describe file('/tmp/add_facts.yaml') do
      it { should exist }
    end
  end
end
