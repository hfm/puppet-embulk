CHANGELOG
===

## [v3.1.0](https://github.com/hfm/puppet-embulk/compare/v3.0.0...v3.1.0) (2018-10-03)

* Use newer libraries [#10](https://github.com/hfm/puppet-embulk/pull/10) ([hfm](https://github.com/hfm))

## [v3.0.0](https://github.com/hfm/puppet-embulk/compare/v2.1.0...v3.0.0) (2018-08-04)

* pdk convert [#9](https://github.com/hfm/puppet-embulk/pull/9) ([hfm](https://github.com/hfm))

## [v2.1.0](https://github.com/hfm/puppet-embulk/compare/v2.0.0...v2.1.0) (2017-11-27)

* Specify absolute path [#8](https://github.com/hfm/puppet-embulk/pull/8) ([hfm](https://github.com/hfm))
* Support Puppet 4.9.0 or later [#7](https://github.com/hfm/puppet-embulk/pull/7) ([hfm](https://github.com/hfm))
* data_provider is deprecated [#6](https://github.com/hfm/puppet-embulk/pull/6) ([hfm](https://github.com/hfm))

v2.0.1 (2017/11/21)
---

- Using puppetlabs-java [#5](https://github.com/hfm/puppet-embulk/pull/5)
- Support Puppet 4.9 or later
- Added supported os

v1.2.0
---

Support Ubunt 12.04 and Debian 6 and 7.

v1.1.0
---

Support Ubuntu 14.04 and Debian 8.

v1.0.1 ~ v1.0.3
---

Fix for Ruby 1.8.7

v1.0.0
---

Implement `embulk::plugin`.

v0.2.1
---

If you specify `ensure => present`, using the latest version of embulk.

v0.2.0
---

Remove a variable of `$version` because it's overlapped with `$ensure`.

v0.1.1 ~ v0.1.5
---

Change metadata.json to specify supported os.

v0.1.0
---

Initial release
