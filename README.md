# puppet-embulk

[![Build Status](https://img.shields.io/travis/hfm/puppet-embulk/master.svg?style=flat-square)](https://travis-ci.org/hfm/puppet-embulk)
[![Puppet Forge](https://img.shields.io/puppetforge/v/hfm/embulk.svg?style=flat-square)](https://forge.puppetlabs.com/hfm/embulk)
[![Puppet Forge](https://img.shields.io/puppetforge/f/hfm/embulk.svg?style=flat-square)](https://forge.puppetlabs.com/hfm/embulk)

#### Table of Contents

1. [Overview](#overview)
1. [Setup - The basics of getting started with embulk](#setup)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

Overview
---

Manage installation of [embulk/embulk](https://github.com/embulk/embulk) and its plugins with Puppet on CentOS.

Setup
---

```
puppet module install hfm-embulk
```

or using [rodjek/librarian-puppet](https://github.com/rodjek/librarian-puppet):

```rb
mod 'hfm-embulk'
```

and execute ``` librarian-puppet install ```.

### Used modules

- [puppetlabs/puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
- [puppetlabs/puppetlabs-java](https://github.com/puppetlabs/puppetlabs-java)

Usage
---

### Installation of embulk

```puppet
include ::embulk

# Default latest version
class { '::embulk': }

# Or you can specify the version of embulk.
class { '::embulk':
  ensure => '0.8.1',
}

# Or you can specify the user of embulk.
class { '::embulk':
  user => 'embulk_user',
}
```

### Installation of embulk plugins

Using `embulk gem` command to install embulk plugins like the following:

```puppet
include ::embulk

::embulk::plugin {
  # Enable to use an array
  [
    'embulk-parser-ltsv',
    'embulk-filter-insert',
  ]:
    ensure => present;

  # You can use latest to be up-to-date version.
  # Default to present.
  'embulk-output-bigquery':
    ensure => latest;
}
```

Limitations
---

Tested on:

- CentOS 5.11
- CentOS 6.6
- CentOS 7.2.1511
- Ubuntu 14.04
- Ubuntu 12.04
- Debian 8
- Debian 7
- Debian 6
