# == Class: wowza::setenv
#  Sets the java parameters for the wowzastreamingengine
#

class wowza::setenv (
  $java_heap_size = $wowza::java_heap_size
) inherits wowza::params {

  file { 'Tune.xml':
    ensure  => 'file',
    path    => "${wowza::params::installdir}/conf/Tune.xml",
    owner   => root,
    group   => root,
    mode    => '0775',
    content => template('wowza/Tune.xml.erb'),
  }
}
