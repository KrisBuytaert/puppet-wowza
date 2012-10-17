class wowza::loadtest (
  $ensure      = present
)
{

  package {
    $wowza::params::loadtest_package:
      ensure => $ensure;
  }

  wowza::configfile {
    'Tests.xml':
        ensure  => $ensure,
        content => template('wowza/Tests.xml.erb');
  }

}
