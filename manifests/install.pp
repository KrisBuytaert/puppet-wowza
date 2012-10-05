class wowza::install {
  $wowza_pkg    = $::wowza::wowza_pkg
  $java_pkg     = $::wowza::java_pkg

  # Installation of the Wowza package
  package { $wowza_pkg:
    ensure => 'present';
  }

  # Installation of the java dependency
  case $::operatingsystem {
    /(?i:debian)/: {
      preseed { $java_pkg:
        ensure => 'present',
        source => 'wowza/debconf.sunjava.erb';
      }
    }
  }
}
