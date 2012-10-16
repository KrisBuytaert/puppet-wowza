class wowza (
  $wowzakey,
  $java_heap_size = $wowza::params::java_heap_size,
  $enable_jmxremote = $wowza::params::enable_jmxremote,
  $wowza_pkg = $wowza::params::wowza_pkg,
  $loadtest_workercount = $wowza::params::loadtest_workercount,
  $loadtest_streamname  = $wowza::params::loadtest_streamname,
  $loadtest_target      = $wowza::params::loadtest_target
) inherits wowza::params {

  class {'wowza::install':;} ~>
    class {'wowza::serverconfig':;} ~>
    class {'wowza::setenv':;} ~>
    class {'wowza::service':;}

}
