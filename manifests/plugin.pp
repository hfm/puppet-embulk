# Class: embulk::plugin
# ===========================
#
# This class manages embulk plugin (gem).
#
# Parameters
# ----------
#
# * `ensure`
# Value to be passed to ensure in the package resource.
# Defaults to "present".
#
# Examples
# --------
#
#  ::embulk::plugin { 'embulk-output-bigquery':
#    ensure => latest,
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

define embulk::plugin (
  $ensure = present,
) {

  require ::embulk

  package { $title:
    ensure   => $ensure,
    provider => 'embulkgem',
  }

}
