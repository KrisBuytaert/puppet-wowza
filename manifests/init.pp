class wowza (
  $wowzakey,
  $java_heap_size = $wowza::params::java_heap_size,
  $wowza_pkg = $wowza::params::wowza_pkg
) inherits wowza::params {

  class {'wowza::install':;} ~>
    class {'wowza::serverconfig':;} ~>
    class {'wowza::setenv':;} ~>
    class {'wowza::service':;}

}

class wowza::disable inherits wowza{
  Service['WowzaMediaServer'] {
    ensure => 'stopped' ,
    enable => false,
  }
}
