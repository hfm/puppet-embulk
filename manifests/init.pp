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
# Defaults to "latest".
#
# * `user`
# The user who will own embulk.
# Defaults to "root".
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
  $ensure  = latest,
  $user    = 'root',
) {

  require ::java

  $url = $ensure ? {
    latest  => 'http://dl.embulk.org/embulk-latest.jar',
    present => 'http://dl.embulk.org/embulk-latest.jar',
    default => "https://dl.bintray.com/embulk/maven/embulk-${ensure}.jar",
  }

  $embulk_dir = $user ? {
    'root'  => '/root/.embulk',
    default => "/home/${user}/.embulk",
  }

  file {
    [
      $embulk_dir,
      "${embulk_dir}/bin",
    ]:
      ensure => 'directory',
      owner  => $user,
  }

  include ::wget
  ::wget::fetch { $url:
    destination => "${embulk_dir}/bin/embulk",
    user        => $user,
    verbose     => false,
  } ~>
  file { "${embulk_dir}/bin/embulk":
    ensure => present,
    owner  => $user,
    mode   => '0755',
  }

}
