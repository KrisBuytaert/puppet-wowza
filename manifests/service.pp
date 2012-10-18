class wowza::service {

  service {
    'WowzaMediaServer':
      ensure    => 'running',
      enable    => $wowza::enable;
  }
}
