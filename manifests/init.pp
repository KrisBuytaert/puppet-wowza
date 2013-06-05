class wowza (
  $wowzakey,
  $enable               = $wowza::params::enable,
  $java_heap_size       = $wowza::params::java_heap_size,
  $wowza_pkg            = $wowza::params::wowza_pkg,
  $wowza_pkg_version    = $wowza::params::wowza_pkg_version,
  $loadtest_ensure      = $wowza::params::loadtest_ensure,
  $loadtest_workercount = $wowza::params::loadtest_workercount,
  $loadtest_streamname  = $wowza::params::loadtest_streamname,
  $loadtest_target      = $wowza::params::loadtest_target,
) inherits wowza::params {
  ##
  #This is the main wowza class.
  # This module is used to set up a wowza streaming serverconfig
  #
  # ==Actions
  # Install a wowza streaming server with basic config
  #


  class {'wowza::install':;} ~>
    class {'wowza::serverconfig':;} ~>
    class {'wowza::config':;} ~>
    class {'wowza::setenv':;} ~>
    class {'wowza::service':;}

  class {
    'wowza::loadtest':
        ensure  => $wowza::loadtest_ensure,
  }
}
