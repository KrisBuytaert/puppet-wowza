class wowza::params {

  $installdir = '/usr/local/WowzaMediaServer'
  $configdir  = "${wowza::params::installdir}/conf/"
  $java_heap_size = '1200M'

  case $::operatingsystem {
    /(?i:debian)/: {
      $wowza_pkg = 'wowzamediaserver-3.1.2'
      $java_pkg = 'openjdk-6-jre'
    }
    default: { fail("Unsupported OS ${::operatingsystem}") }
  }
}
