# == Define: wowza::application
# Define a new wowza streaming engine application
#
# === Parameters:
#
# [*ensure*]
#    Set a state for this application: present or absent
#
# [*appdescription*]
#    A human readable description for this application
#
# [*apptype*]
#    Set the type of application you want to create: Live, VOD, livehttporigin,
#    vodhttporigin, liveedge, vodedge
#
# [*streamtype*]
#    Set the stream type: default, file, live, live-lowlatency, live-record,
#    live-record-lowlatency, liverepeater-edge, liverepeater-edge-lowlatency,
#    liverepeater-edge-origin, record, rtp-live, rtp-live-lowlatency,
#    rtp-live-record, rtp-live-record-lowlatency, shoutcast, shoutcast-record
#    See the wowza user manual for more information regarding the various types.
#
# [*livestreampacketizers*]
#    packetization schemes for incoming live streams, one or multiple entries
#    are possible ( separated by comma ), possible packetizers:
#    cupertinostreamingpacketizer, smoothstreamingpacketizer,
#    sanjosestreamingpacketizer, mpegdashstreamingpacketizer,
#    cupertinostreamingrepeater, smoothstreamingrepeater,
#    sanjosestreamingrepeater, mpegdashstreamingrepeater,
#    dvrstreamingpacketizer, dvrstreamingrepeater
#    See the wowza configurationreference for more information on the different
#    packetizers.
#
#  [*playmethod*]
#    Authentication setting for outgoing connections, possible values are:
#    none, basic and digest
#
#  [*rtmp_protect*]
#    Enable authentication for incoming connections, this setting includes the
#    necessary plugins for authentication and creates a per application
#    password file in the application folder.
#
#  [*user*]
#    user to create the files and folder under
#
#  [*group*]
#    group to create the files and folder under
#
#  [*applicationtimeout*]
#    Length of time (in ms) before an application is shut down to which no clients are
#    connected. Setting this to 0 keeps the application running until the server
#    is shut down.
#
#  [*pingtimeout*]
#    Time (in ms) that the application will wait for a ping response from the
#    client.
#
#  [*validationfrequency*]
#    Time (in ms) that the server will wait during server-to-client validation.
#
#  [*storagedir*]
#    Full path to the directory where the application will read/write files from.
#
#  [*origin_url*]
#    origin url when using the application as a live stream repeater.
#
#  [*target_password_file*]
#    target location for a password file, instead of the default operation ( an
#    empty password file is created ) a symlink is created to the path provided
#    in this parameter.
#

define wowza::application (
  $ensure                 = present,
  $appdescription         = 'live stream application',
  $apptype                = 'Live',
  $streamtype             = 'live',
  $livestreampacketizers  = 'cupertinostreamingpacketizer, smoothstreamingpacketizer',
  $playmethod             = 'none',
  $rtmp_protect           = false,
  $user                   = 'root',
  $group                  = 'root',
  $applicationtimeout     = '60000',
  $pingtimeout            = '12000',
  $validationfrequency    = '8000',
  $storagedir             = undef,
  $origin_url             = undef,
  $target_password_file   = undef,
  $shared_token           = false,
  $publish_whitelist      = false,
) {

  $dir_ensure = $ensure ? {
    present => 'directory',
    true    => 'directory',
    default => 'absent',
  }

  # Create application folder
  file { "${wowza::params::installdir}/applications/${name}":
    ensure => $dir_ensure,
    force  => true,
    owner  => $user,
    group  => $group,
    mode   => '0755',
  }

  # Create application config file and folder
  file { "${wowza::params::installdir}/conf/${name}":
    ensure => $dir_ensure,
    force  => true,
    owner  => $user,
    group  => $group,
    mode   => '0755';
  }

  file { "${wowza::params::installdir}/conf/${name}/Application.xml":
    ensure  => $ensure,
    owner   => $user,
    group   => $group,
    mode    => '0644',
    content => template('wowza/application.xml.erb'),
    notify  => Class['wowza::service'];
  }

  if $rtmp_protect {
    if $target_password_file {

      $link_ensure = $ensure ? {
        present => 'link',
        true    => 'link',
        default => 'absent',
      }

      file { "${wowza::params::installdir}/conf/${name}/publish.password":
        ensure  => $link_ensure,
        owner   => $user,
        group   => $group,
        mode    => '0640',
        target  => $target_password_file,
        notify  => Class['wowza::service'];
      }
    } else {
      file { "${wowza::params::installdir}/conf/${name}/publish.password":
        ensure  => $ensure,
        owner   => $user,
        group   => $group,
        mode    => '0640',
        replace => false,
        source  => 'puppet:///modules/wowza/publish.password',
        notify  => Class['wowza::service'];
      }
    }
  }
}
