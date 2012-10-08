class wowza::config (
  $application,
  $streamtype = "live",
  $livestreampacketizers = "cupertinostreamingpacketizer, smoothstreamingpacketizer",
  $playmethod = "none",
) inherits wowza::params {

  file { "${wowza::params::installdir}/application/${application}":
    ensure => 'directory',
  }

  file {"${wowza::params::installdir}/conf/${application}":
    ensure => 'directory',
  }

  file {"Application.xml":
    path    => "${wowza::params::installdir}/conf/${application}",
    ensure  => 'file',
    owner   => root,
    group   => root,
    mode    => 0644,
    content => template("wowza/application.xml.erb"),
  }
}
