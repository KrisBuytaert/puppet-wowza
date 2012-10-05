class wowza::params {

  case $::operatingsystem {
    /(?i:debian)/: {
      $wowza_pkg = wowzamediaserver-3.1.2
      $java_pkg = sun-java6-jre
    }
  }
}
