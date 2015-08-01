class svnserver::install{
	
	class{'apache':
		default_mods => false
	}

	apache::mod { 'dav_svn':}
	apache::mod { 'authn_core':}

	package {'subversion':
		ensure => present
	}

	package {'apache2-utils':
		ensure => present,
		require => Class['apache']
	}
}