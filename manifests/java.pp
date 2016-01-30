class embulk::java {

  $java_version = $::operatingsystem ? {
    'RedHat' => 'java-1.7.0-openjdk',
    'Debian' => 'openjdk-7-jre-headless',
    'Ubuntu' => 'openjdk-7-jre-headless',
  }
  ensure_packages($java_version)
}
