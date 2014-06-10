class wowza::params {
  $installdir           = '/usr/local/WowzaStreamingEngine'
  $java_heap_size       = '${com.wowza.wms.TuningHeapSizeProduction}'
  $wowza_pkg_version    = '4.0.0'
  # Start opencast on boot
  $enable               = true
  $enable_manager       = true
  $loadtest_ensure      = absent
  $loadtest_workercount = '1'
  $loadtest_streamname  = 'myStream'
  $loadtest_target      = '127.0.0.1'
  $configdir            = "${installdir}/conf/"

  case $::operatingsystem {
    /(?i:debian)/: {
      $wowza_pkg        = 'wowzastreamingengine'
      $loadtest_package = 'wowzastreamingengine-loadtest'
      $java_pkg         = 'openjdk-7-jre'
    }
    default: { fail("Unsupported OS ${::operatingsystem}") }
  }
}
