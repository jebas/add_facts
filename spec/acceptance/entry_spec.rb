# spec/acceptance/entry_spec.rb

require 'spec_helper_acceptance'

describe 'add_facts entry' do
  it 'should run with no errors' do
    pp = <<-EOS
      add_facts::entry { 'foo':
        value => 'bar',
      }
    EOS
    expect(apply_manifest(pp).exit_code).to_not eq(1)
    expect(apply_manifest(pp).exit_code).to eq(0)
  end
end
