#
#Class: wowza::install
#

class wowza::install {
  $wowza    = "${::wowza::wowza_pkg}-${::wowza::wowza_pkg_version}"
  $java_pkg     = $::wowza::java_pkg

  # Installation of the Wowza package
  # and java pkg
  package {
    [$wowza, $java_pkg]:
      ensure => 'present';
  }
}
