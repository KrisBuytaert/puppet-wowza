class wowza::loadtest (
  $ensure      = present
) {
  $wowza_load = "${::wowza::loadtest_package}-${::wowza::wowza_pkg_version}"
  package {
    $wowza_load:
      ensure => $ensure;
  }

  wowza::configfile {
    'Tests.xml':
        ensure  => $ensure,
        content => template('wowza/Tests.xml.erb');
  }
}
