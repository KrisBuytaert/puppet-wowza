class wowza (
  $wowzakey,
  $java_heap_size      = $wowza::params::java_heap_size,
  $wowza_pkg           = $wowza::params::wowza_pkg,
  $jmxhost             = '',
  $jmxservice_url      = '',
  $jmxservice_user     = '',
  $jmxservice_password = ''
) inherits wowza::params {

  class {'wowza::install':;} ~>
    class {'wowza::serverconfig':;} ~>
    class {'wowza::setenv':;} ~>
    class {'wowza::service':;}

}
