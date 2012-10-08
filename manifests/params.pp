class wowza::params {

  $installdir = '/usr/local/WowzaMediaServer'
  $java_heap_size = '1200M'

  case $::operatingsystem {
    /(?i:debian)/: {
      $wowza_pkg = 'wowzamediaserver-3.1.2'
      $java_pkg = 'sun-java6-jre'
    }
  }
}
