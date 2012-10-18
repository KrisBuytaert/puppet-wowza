class wowza::config (
  $application,
  $streamtype = 'live',
  $livestreampacketizers = 'cupertinostreamingpacketizer, smoothstreamingpacketizer',
  $playmethod = 'none'
) inherits wowza::params {

  file {
    "${wowza::params::installdir}/applications/${application}":
      ensure => 'directory';
    "${wowza::params::installdir}/conf/${application}":
      ensure => 'directory';
    'Application.xml':
      ensure  => 'file',
      path    => "${wowza::params::installdir}/conf/${application}/Application.xml",
      owner   => root,
      group   => root,
      mode    => '0644',
      content => template('wowza/application.xml.erb'),
      notify  => Service['WowzaMediaServer'];
    '/etc/init.d/WowzaMediaServer':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      source  => 'puppet:///modules/wowza/WowzaMediaServer.init';
  }
}
