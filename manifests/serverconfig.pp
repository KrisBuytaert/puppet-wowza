class wowza::serverconfig {

  file { '/usr/local/WowzaMediaServer/conf/Server.license':
    content => $::wowza::wowzakey,
  }

  #change permissions for the folders
  file { "${::wowza::installdir}/logs":
    ensure => 'present',
    mode   => '0775',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/conf":
    ensure => 'present',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/applications":
    ensure => 'present',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/content":
    ensure => 'present',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/keys":
    ensure => 'present',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { "${::wowza::installdir}/transcoder":
    ensure => 'present',
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  #Change log configuration to log statistics in an awstats understandable format
  #Also create logs for each separate vhost and applications
  file { "${::wowza::installdir}/conf/log4j.properties":
    ensure  => 'present',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    replace => true,
    source  => 'puppet:///modules/wowza/log4j.properties',
  }
}
