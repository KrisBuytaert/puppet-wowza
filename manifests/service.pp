class wowza::service {

  service {
    'WowzaMediaServer':
      ensure => 'running' ,
  }
}

