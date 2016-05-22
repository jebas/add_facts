require 'spec_helper'
describe 'add_facts' do

  context 'with default values for all parameters' do
    it { should contain_class('add_facts') }
  end
end
