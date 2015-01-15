# Puppet module: csync2

#### Table of contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Backwards incompatibility](#backwards-incompatibility)
4. [Setup - The basics of getting started with csync2](#setup)
    * [What csync2 affects](#what-csync2-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with csync2](#beginning-with-csync2)
5. [Usage - Configuration options and additional functionality](#usage)
6. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
7. [Limitations - OS compatibility, etc.](#limitations)
8. [Development - Guide for contributing to the module](#development)
9. [Contributors](#contributors)

##Overview

This is a puppet module to manage csync2. Works on puppet >= 2.7 and Debian systems.

##Module description

csync2 is a cluster synchronization tool and this module provides a way
to manage it with puppet, using pre-shared keys and a custom configuration
template.

## Setup

### What csync2 effects

* csync2 package
* csync2 main configuration file (/etc/csync2.cfg)
* a csync2 key in /etc/csync2.key

### Beginning with csync2

To get started with csync2, you need:

- a configuration template or file for csync2, since the module does not
  provide a default
- a key for csync2 (for example created with csync2 -k)

The module supports a generic options hash via the options argument,
which can be used to pass parameters to your template.

```puppet
class { '::csync2':
  config_template   => 'modules/site/csync2.cfg.erb',
  key               => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  options           => $options_hash
}
```

### Setup requirements

This module template requires the params_lookup function as found in the example42
puppi module (https://github.com/credativ/puppet-example42lib)

##Usage

You can include the classes you need and configure it via the parameters it
supports. Please see the class docs for supported parameters and their
meaning.

It also does automatic parameter lookups via the params_lookup function.
That way, there are several ways to feed parameters into classes created
with this module:

- via parameters
- by setting global variables, e.g.

    $csync2_config_template = "foobar.erb"

- by setting it in hiera, e.g.

    csync2_manage_config: false 

### Classes

#### csync2

Installs and configures csync2 and a keyfile.

## Reference

The module contains the following public clases:

- csync2

## Limitations

This module has been tested and is used primarily on Debian-based systems.
Other systems may be supported but cannot be guaranted.

## Development

I happily accept bug reports and pull requests via github.

## Contributors

This module is written and being maintained by
    
    Patrick Schoenfeld <patrick.schoenfeld@credativ.de>.

