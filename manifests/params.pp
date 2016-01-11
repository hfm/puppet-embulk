# Class: embulk::params
# ===========================
#
# This class is meant to be called from embulk.
# It sets variables.

class embulk::params {
  $ensure  = present
  $version = 'latest'
  $user    = 'root'
}
