class wowza (
  $wowzakey,
  $java_heap_size       = $wowza::params::java_heap_size,
  $wowza_pkg            = $wowza::params::wowza_pkg,
  $loadtest_ensure      = $wowza::params::loadtest_ensure,
  $loadtest_workercount = $wowza::params::loadtest_workercount,
  $loadtest_streamname  = $wowza::params::loadtest_streamname,
  $loadtest_target      = $wowza::params::loadtest_target,
) inherits wowza::params {

  class {'wowza::install':;} ~>
    class {'wowza::serverconfig':;} ~>
    class {'wowza::setenv':;} ~>
    class {'wowza::service':;}

  class {
    'wowza::loadtest':
        ensure  => $wowza::loadtest_ensure,
  }
}
