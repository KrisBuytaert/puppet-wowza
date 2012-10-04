class wowza::params {

  case $::operatingsystem {
    /(?i:debian)/: {
      $wowza_pkg = WowzaMediaServer
      $java_pkg = sun-java6-jre
    }
  }
}
