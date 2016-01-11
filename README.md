# puppet-embulk

[![Build Status](https://travis-ci.org/hfm/puppet-embulk.svg?branch=master)](https://travis-ci.org/hfm/puppet-embulk)

#### Table of Contents

1. [Overview](#overview)
1. [Setup - The basics of getting started with embulk](#setup)
    * [What embulk affects](#what-embulk-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with embulk](#beginning-with-embulk)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
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

## Usage

This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module.

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.
