define wowza::configfile (
  $ensure  = present,
  $content = '',
  $source  = '') {

  if($content == '') and ($source == '') {
    fail('wowza::configfile must set content or source')
  }

  if($content != '') and ($source != '') {
    fail('wowza::configfile must set content or source')
  }

  if($content != '')
  {
    file {
      "${wowza::configdir}/${name}":
        ensure  => $ensure,
        content => $content,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        notify  => Class['wowza::service'],
    }
  }

  if($source != '')
  {
    file {
      "${wowza::configdir}/${name}":
        ensure  => $ensure,
        source  => $source,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        notify  => Class['wowza::service'],
    }
  }
}
