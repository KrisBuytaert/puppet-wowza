# puppet-wowza

This is the puppet-wowza module used for installing and configuring wowza streaming server.

## Use

### Install Wowza streaming server

$wowzakey is your Wowza streaming server license key
At the moment only debian works, and you have to have the wowza streaming server deb installer in an internal repo.

class { 'wowza':
  wowzakey => $wowzakey;
}

### Add Wowza application

This adds a live stream application, defaults all work for a standard live streaming application. At the moment this is
also the only thing supported:

class { 'wowza::config':
  application => 'live';
}

### Set Java Heap size

By default it sets the size to 1200M

class { 'wowza':
  wowzakey       => $wowzakey,
  java_heap_size => '3000M';
}

