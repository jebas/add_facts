# add_facts

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with add_facts](#setup)
    * [What add_facts affects](#what-add_facts-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with add_facts](#beginning-with-add_facts)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Add_facts could be thought of as a temporary or permanent replacement to an 
ENC.  Though it will not handle environment changes, it will add external 
facts stored in the hieradata so that the next pass will alter puppet's 
behavior.

Like most ENCs, it can be used to provide additional information that puppet uses 
to create a catalog.  This could include defining the application installed (web, 
database, file server...), the application environment (prod, qa, dev...), or 
location (London, Atlanta, downstairs...).  All of this is information that usually 
cannot be derived from a newly installed machine.

However, unlike an ENC, add_facts creates an add_facts.yaml file, and places it into
the facts.d directory.  This allows the information to always remain with the 
node and bed stored in the hieradata.

## Setup

### What add_facts affects

Add_facts affects the output of facter.

After the module is applied, facter will start displaying the facts added by 
the module.

### Setup Requirements

To make full use of add_facts, you should also make changes in your hiera
configuration file.  If you are a fact called app to your node, you might 
want to add an entry to the hiera.yaml that reads, '- "apps/%{facts.app}"' 
to take advantage of the information.

### Beginning with add_facts

Using the add_facts module involves two steps.

+ Use the base class to establish the facts.d directory.
+ Use the add_facts::entry or add_facts::entries to add the information.

## Usage

+ Installing the base class.

    The base class is used to determine the location of the facts.d directory, 
and by default it is '/opt/puppetlabs/facter/facts.d'.  The only variable is 
directory.  Therefore the class can be called by either 

        class { 'add_facts': }

    or

        class { 'add_facts':
            directory => '/etc/fact/facts.d',
        }

+ Using add_facts::entry

    Entry is a wrapper around ini_setting, which is used to add and remove
the fact entries.  The following is an example entry.

        add_facts::entry { 'app':
            ensure => present,
            value  => 'web',
        }

+ Using add_facts::entries

    Entries is a hieradata wrapper around entry.  It allows you enter several 
items at once.  First enter the hieradata into an existing file.  The following 
example could be placed into the hieradata/nodes/web10.example.com.yaml file.

        classes:
            - add_facts
            - add_facts::entries

        add_facts::entries::args:
            app:
                value: web
            app_env:
                value: qa

    Of course the above example is assuming that manifest is using some 
equivalent to hiera_include.

## Reference

+ Classes
    + add_facts
    + add_facts::entries
+ Defined Types
    + add_facts::entry

## Limitations

This module creates a two pass deployment.  The first pass adds the facts
to the node, and the second pass creates the catalog based on the new facts.


## Development

This module was developed using beaker.  To run the tests use:

    PUPPET_INSTALL_TYPE=agent rspec spec/acceptance

## Release Notes/Contributors/Etc. 

This is the initial release.
