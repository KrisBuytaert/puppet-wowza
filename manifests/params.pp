# == Class: wowza:params
# Class that holds the diferent configuration parameters for the wowza streaming
#  engine.
#
# === Parameters:
#
# [*installdir*]
#  Location to which the streaming engine is installed, the default here is what
#  is used by the default wowza installer.
#
# [*java_heap_size*]
#  Java heap size, can be set to ${com.wowza.wms.TuningHeapSizeProduction} or
#  ${com.wowza.wms.TuningHeapSizeDevelopment} or a fixed size ( 4G, 4000M, ... )
#
# [*wowza_pkg_version*]
#  Version of the wowzastreamingengine to install
#
# [*enable*]
#  Start wowza streaming engine on boot
#
# [*enable_manager*]
#  Start wowza streaming engine manager on boot
#
# [*loadtest_ensure*]
#  Enable the loadtest application
#
# [*loadtest_workercount*]
#  Number of workers for the loadtest
#
# [*loadtest_streamname*]
#  Streamname to request by the loadtest application
#
# [*configdir*]
#  Default directory that contains the configuration files.
#

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
