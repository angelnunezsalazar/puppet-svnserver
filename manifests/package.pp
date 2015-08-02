class svnserver::package{
	package {'subversion':
		ensure => present
	}
}