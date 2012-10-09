class wowza::install {
  $wowza_pkg    = $::wowza::wowza_pkg
  $java_pkg     = $::wowza::java_pkg

  # Installation of the Wowza package
  # and java pkg
  package {
    [$wowza_pkg, $java_pkg]:
      ensure => 'present';
  }

  #change permissions for the folders
  file { "${::wowza::installdir}/logs":
    ensure => 'present',
    mode   => '775',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/conf":
    ensure => 'present',
    mode   => '755',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/applications":
    ensure => 'present',
    mode   => '755',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/content":
    ensure => 'present',
    mode   => '755',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/keys":
    ensure => 'present',
    mode   => '755',
    owner  => 'root',
    group  => 'root',
  }
  
  file { "${::wowza::installdir}/transcoder":
    ensure => 'present',
    mode   => '755',
    owner  => 'root',
    group  => 'root',
  }

  #Change log configuration to log statistics in an awstats understandable format
  #Also create logs for each separate vhost and applications
  file { "${::wowza::installdir}/conf/log4j.properties":
    ensure  => 'present',
    mode    => '644',
    owner   => 'root',
    group   => 'root',
    replace => 'true',
    source  => 'puppet:///modules/wowza/log4j.properties',
  }
}
