class wowza{

 package {
                "java":
                        ensure  => "installed";
                "WowzaMediaServer":
                        ensure  => "installed";

   }

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

