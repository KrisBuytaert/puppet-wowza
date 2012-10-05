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
        source => 'sun-java6-jdk shared/accepted-sun-dlj-v1-1 boolean true';
      }
    }
  }
}
