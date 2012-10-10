class wowza::setenv (
  $java_heap_size = $wowza::java_heap_size
) inherits wowza::params {

  file { 'setenv.sh':
    ensure  => 'file',
    path    => "${wowza::params::installdir}/bin/setenv.sh",
    owner   => root,
    group   => root,
    mode    => '0775',
    content => template('wowza/setenv.sh.erb'),
  }
}
