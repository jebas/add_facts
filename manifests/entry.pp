# Resource: add_facts::entry
# ===========================
#
# manifests/entry.pp
#
# This is a resource that adds or removes a fact from the file.  
#
# Parameters
# ----------
#
# @param [Any] ensure Determines if fact present or absent.
# * `ensure`
# Determines if a fact is present or absent.  
#
# @param [String] value Value of the fact
# * `value`
# Value of the fact
#
# Variables
# ----------
#
# Examples
# --------
#
# @example
#    add_facts::entry { 'application':
#      value => 'webserver',
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

define add_facts::entry (
  $ensure       = present,
  String $value = '',
) {
  ini_setting { "add_facts ${title}":
    ensure            => $ensure,
    path              => "${add_facts::directory}/add_facts.yaml",
    setting           => $title,
    value             => $value,
    key_val_separator => ': ',
  }
}
