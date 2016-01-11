# Class: embulk
# ===========================
#
# This class install and configure embulk.
#
# Parameters
# ----------
#
# * `ensure`
# Value to be passed to ensure in the package resource.
# Defaults to "present".
#
# * `version`
# Value to be passed to ensure in the package resource.
# Defaults to "latest".
#
# Examples
# --------
#
#  class { 'embulk':
#    ensure  => present,
#    version => 'latest',
#  }
#
# Authors
# -------
#
# Okumura Takahiro <hfm.garden@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Okumura Takahiro.

class embulk (
  $ensure  = $::embulk::params::present,
  $version = $::embulk::params::version,
  $user    = $::embulk::params::user,
) inherits ::embulk::params {

  class { 'embulk::install': }

}
