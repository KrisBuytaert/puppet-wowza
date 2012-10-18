define wowza::application (
  $application = '',
  $streamtype = 'live',
  $livestreampacketizers = 'cupertinostreamingpacketizer, smoothstreamingpacketizer',
  $playmethod = 'none') {
  
  # Create application folder
  file { "${wowza::params::installdir}/applications/${application}":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  # Create application config file and folder
  file { "${wowza::params::installdir}/conf/${application}":
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755';
  }

  file { "${wowza::params::installdir}/conf/${application}/Application.xml":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('wowza/application.xml.erb'),
    notify  => Service['WowzaMediaServer'];
  }
}
