class wowza::service {

  service {
    'WowzaMediaServer':
      ensure    => 'running',
      # Poorly implemented status command in
      # Debian init script
      hasstatus => false,
      enable    => $wowza::enable;
  }
}
