# spec/acceptance/spec_helper_acceptance.rb

require 'beaker-rspec'
require 'pry'

step "Install Puppet on each host"
install_puppet_agent_on( hosts, { :puppet_collection => 'pc1' } )

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  c.formatter = :documentation
  c.before :suite do
    puppet_module_install(
      :source      => module_root,
      :module_name => 'add_facts',
    )
    hosts.each do |host|
    end
  end
end
