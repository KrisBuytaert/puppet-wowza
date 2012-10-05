class wowza () inherits wowza::params {

  include wowza::install

  file { 
	  "/usr/local/WowzaMediaServer/conf/Server.license":
		  require => Package["WowzaMediaServer"],
		  content => "<%= wowzakey %>" ,
	}

  service {
	  "WowzaMediaServer": 
      ensure => "running" ,
      enable => "true",
	}
}

class wowza::disable inherits wowza{
	Service["WowzaMediaServer"] {
	  ensure => "stopped" ,
    enable => "false",
  }
}
