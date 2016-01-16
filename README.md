# puppet-embulk

[![Build Status](https://travis-ci.org/hfm/puppet-embulk.svg?branch=master)](https://travis-ci.org/hfm/puppet-embulk)

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

Usage
---

```puppet
include ::embulk

class { '::embulk':
  version => '0.7.9',
}
```

Limitations
---

Tested on:

- CentOS 5.11
- CentOS 6.6
- CentOS 7.2.1511
