# == Class: wowza::service
#  Defines the services provided by the wowzastreamingengine. The are the main
#  package ( wowzastreamingengine ) and the optional manager application that
#  provides a web frontend to manage the different applications.
#

class wowza::service {

  service {
    'WowzaStreamingEngine':
      ensure    => 'running',
      enable    => $wowza::enable;
  }

  service {
    'WowzaStreamingEngineManager':
      ensure    => 'running',
      enable    => $wowza::enable_manager;
  }
}
