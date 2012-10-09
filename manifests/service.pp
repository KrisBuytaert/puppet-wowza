class wowza::service inherits wowza::params {

  service {
    'WowzaMediaServer':
      ensure => 'running' ,
  }
}

