node default {

  class {
    'wowza':
      wowzakey => 'mykey';
    'wowza::config':
      application => 'live';
  }

}
