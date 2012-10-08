class wowza (
  $wowzakey,
  $wowza_pkg = $wowza::params::wowza_pkg
) inherits wowza::params {

  include wowza::install
  include wowza::setenv

  file { '/usr/local/WowzaMediaServer/conf/Server.license':
    require => Package[$wowza_pkg],
    content => $wowzakey,
  }

  service {
    'WowzaMediaServer':
      ensure => 'running' ,
      enable => 'true',
  }
}

class wowza::disable inherits wowza{
  Service['WowzaMediaServer'] {
    ensure => 'stopped' ,
    enable => 'false',
  }
}
