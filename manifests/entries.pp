# Class: add_facts::entries
# ===========================
#
# manifests/entries.pp
#
# This is used to import a series of facts onto the node.
#
# Parameters
# ----------
#
# @param [Hash] args Hash of facts and values.  
# * `args` Hask of facts and values
#
# Variables
# ----------
#
# Examples
# --------
#
# @example
#    class { 'add_facts::entries':
#    	args => { 'application' => { 'value' => 'webserver' }
#                 'datacenter'  => { 'value' => 'London' }}
#    }
#
# Authors
# -------
#
# Jeff Baskin <jeff.l.baskin@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Jeff Baskin
#

class add_facts::entries (
  Hash $args = {},
){
  create_resources(add_facts::entry, $args)
}
