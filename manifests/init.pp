# Class: add_facts
# ===========================
#
# manifests/init.pp
#
# This adds additional facts that are used in the next run
#
# Parameters
# ----------
#
# @param [String] directory Where the facts will be written
# * `directory`
# Where the facts file will be written.  
#
# Variables
# ----------
#
# Examples
# --------
#
# @example
#    class { 'add_facts':
#      servers => '/etc/facter/facts.d'
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
class add_facts (
  String $directory = '/opt/puppetlabs/facter/facts.d',
) {


}
