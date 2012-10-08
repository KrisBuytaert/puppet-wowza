class wowza::config (
  $application,
  $streamtype = 'live',
  $livestreampacketizers = 'cupertinostreamingpacketizer, smoothstreamingpacketizer',
  $playmethod = 'none'
) inherits wowza::params {

  file { "${wowza::params::installdir}/applications/${application}":
    ensure => 'directory',
  }

  file {"${wowza::params::installdir}/conf/${application}":
    ensure => 'directory',
  }

  file {'Application.xml':
    ensure  => 'file',
    path    => "${wowza::params::installdir}/conf/${application}/Application.xml",
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('wowza/application.xml.erb'),
    notify  => Service['WowzaMediaServer'],
  }
}
