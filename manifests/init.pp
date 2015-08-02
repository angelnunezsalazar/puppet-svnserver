# svn_user
#   (Optional) This module doesn't create the user. 
#   The user should be managed outside this module
#
# svn_password
#   (Optinal) The password to login to subversion server, not the OS password.
#

# TODO: default repo: deberia ser opcional el nombre
class svnserver(
	$svn_user  					= undef,
	$svn_password				= undef,
	$defaultrepository_name		= undef,
)inherits ::svnserver::params{

	Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

		class{'apache':
		default_mods => false
	}

	#include svnserver::apachemods
	include svnserver::package
	include svnserver::config
	include svnserver::users
	include svnserver::repositories

	Class['svnserver::package']
	-> Class['svnserver::config']
		-> Class['svnserver::users']
			-> Class['svnserver::repositories']
}