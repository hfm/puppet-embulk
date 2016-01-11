# Class: embulk::install
# ===========================
#
# Install embulk.jar.
#
class embulk::install (
  $ensure  = $::embulk::params::present,
  $version = $::embulk::params::version,
  $user    = $::embulk::params::user,
){

  $url = $::version ? {
    'latest' => 'http://dl.embulk.org/embulk-latest.jar',
    default  => "https://dl.bintray.com/embulk/maven/embulk-${version}.jar",
  }

  $created_path = $::user ? {
    'root'  => '/root/.embulk/bin/embulk',
    default => "/home/${user}/.embulk/bin/embulk",
  }

  exec { 'install embulk':
    command => "curl --create-dirs -o ~/.embulk/bin/embulk -L '${url}'",
    path    => ['/bin','/usr/bin'],
    user    => $user,
    creates => $created_path,
  }
}
