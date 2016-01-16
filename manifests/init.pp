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
  $ensure  = present,
  $version = 'latest',
  $user    = 'root',
) {

  $url = $::version ? {
    'latest' => 'http://dl.embulk.org/embulk-latest.jar',
    default  => "https://dl.bintray.com/embulk/maven/embulk-${version}.jar",
  }

  $created_path = $::user ? {
    'root'  => '/root/.embulk/bin/embulk',
    default => "/home/${user}/.embulk/bin/embulk",
  }

  include ::wget
  ::wget::fetch { $url:
    destination => $created_path,
    user        => $user,
    verbose     => false,
  }

}
