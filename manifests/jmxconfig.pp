class wowza::jmxconfig (
  $enable_jmxremote = $wowza::enable_jmxremote
) inherits wowza::params {

  file { 'Server.xml':
    ensure  => 'file',
    path    => "${wowza::params::installdir}/conf/Server.xml",
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    content => template('wowza/Server.xml.erb'),
  }
}
