class wowza::params {

  $installdir = '/usr/local/WowzaMediaServer'
  $configdir  = "${wowza::params::installdir}/conf/"
  $java_heap_size = '1200M'
  $wowza_pkg_version = '3.1.2'

  # Start service at boot
  $enable = true

  # Load test params
  $loadtest_ensure      = absent
  $loadtest_workercount = '1'
  $loadtest_streamname  = 'myStream'
  $loadtest_target      = '127.0.0.1'

  case $::operatingsystem {
    /(?i:debian)/: {
      $wowza_pkg        = "wowzamediaserver-${wowza::params::wowza_pkg_version}"
      $loadtest_package = "wowzamediaserver-loadtest-${wowza::params::wowza_pkg_version}"
      $java_pkg         = 'openjdk-6-jre'
    }
    default: { fail("Unsupported OS ${::operatingsystem}") }
  }
}
