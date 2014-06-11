# puppet-wowza

This is the puppet-wowza module used for installing and configuring wowza streaming server.

## Use

### Install Wowza streaming server

$wowzakey is your Wowza streaming server license key
At the moment only debian works, and you have to have the wowza streaming server deb installer in an internal repo.

<pre><code>
class { 'wowza':
  wowzakey => $wowzakey;
}
</code></pre>

### Add Wowza application

This adds a wowza application, defaults all work for a standard live streaming application. You can also use this to define a
video on demand application by using the default type.

Live :

```
wowza::application { 'live':
  appname    => 'live',
  apptype    => 'Live',
  streamtype => 'live'
}
```

VOD :

```
wowza::application {'vod':
  appname      => 'videoondemand',
  apptype      => 'VOD',
  streamtype   => 'default',
	rtmp_protect => true,
  storagedir   => '/var/content'
}
```

### Set Java Heap size

By default it sets the size to 1200M

```
class { 'wowza':
  wowzakey       => $wowzakey,
  java_heap_size => '3000M';
}
```
