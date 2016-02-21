node default {
  class { '::embulk':
    ensure => latest,
  }

  ::embulk::plugin {
    'embulk-parser-ltsv':
      ensure => present;

    'embulk-output-bigquery':
      ensure => latest;
  }

}
