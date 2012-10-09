class wowza::install {
  $wowza_pkg    = $::wowza::wowza_pkg
  $java_pkg     = $::wowza::java_pkg

  # Installation of the Wowza package
  # and java pkg
  package {
    [$wowza_pkg, $java_pkg]:
      ensure => 'present';
  }
}
