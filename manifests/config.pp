class wowza::config (
) inherits wowza::params {

  # Place wowza media server init script
  file { '/etc/init.d/WowzaMediaServer':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      source  => 'puppet:///modules/wowza/WowzaMediaServer.init';
  }
}
