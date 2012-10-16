class wowza::params {

  $installdir = '/usr/local/WowzaMediaServer'
  $configdir  = "${wowza::params::installdir}/conf/"
  $java_heap_size = '1200M'

  # Load test params
  $loadtest_ensure      = absent
  $loadtest_workercount = '1'
  $loadtest_streamname  = 'myStream'
  $loadtest_target      = '127.0.0.1'

  case $::operatingsystem {
    /(?i:debian)/: {
      $wowza_pkg        = 'wowzamediaserver-3.1.2'
      $loadtest_package = 'wowzamediaserver-loadtest-3.1.2'
      $java_pkg         = 'openjdk-6-jre'
    }
    default: { fail("Unsupported OS ${::operatingsystem}") }
  }
}
