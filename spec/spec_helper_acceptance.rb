# spec/acceptance/spec_helper_acceptance.rb

require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'pry'

step "Install Puppet on each host"
run_puppet_install_helper

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  c.formatter = :documentation
  c.before :suite do
    puppet_module_install(
      :source      => module_root,
      :module_name => 'add_facts',
    )
    hosts.each do |host|
      write_hiera_config_on(host, ['common'])
      copy_hiera_data_to(host, File.join(module_root, 'spec', 'fixtures'))
      on host, puppet('module', 'install', 'puppetlabs-inifile'),
        {:acceptable_exit_codes => [0,1]}
    end
  end
end
