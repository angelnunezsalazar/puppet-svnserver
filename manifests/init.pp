# svn_user
#   (Optional) This module doesn't create the user. 
#   The user should be managed outside this module
#
# svn_password
#   (Optinal) The password to login to subversion server, not the OS password.
#

#TODO: Usuario y password deberian ser obligatorios

class svnserver(
	$svn_user  					= undef,
	$svn_password				= undef,
	$default_repository_name	= undef,
)inherits ::svnserver::params{

	Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
	
	include svnserver::install
	include svnserver::config
	include svnserver::users
	include svnserver::repositories

	Class['svnserver::install']
	-> Class['svnserver::config']
		-> Class['svnserver::users']
			-> Class['svnserver::repositories']
}