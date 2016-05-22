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
end
