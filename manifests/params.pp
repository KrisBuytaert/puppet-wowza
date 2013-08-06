class wowza::params {
  $installdir           = '/usr/local/WowzaMediaServer'
  $java_heap_size       = '1200M'
  $wowza_pkg_version    = '3.1.2'
  # Start opencast on boot
  $enable               = true
  $loadtest_ensure      = absent
  $loadtest_workercount = '1'
  $loadtest_streamname  = 'myStream'
  $loadtest_target      = '127.0.0.1'
  $configdir            = "${installdir}/conf/"

  case $::operatingsystem {
    /(?i:debian)/: {
      $wowza_pkg        = 'wowzamediaserver'
      $loadtest_package = 'wowzamediaserver-loadtest'
      $java_pkg         = 'openjdk-6-jre'
    }
    default: { fail("Unsupported OS ${::operatingsystem}") }
  }
}
