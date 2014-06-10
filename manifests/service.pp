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
