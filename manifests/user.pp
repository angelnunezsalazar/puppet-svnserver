
#TODO: solo maneja el primer usuario, falta lógica para que no vuelva a crear el archivo si ya existe
define svnserver::user(
	$password
){
	# The base class must be included first because it is used to extract some variables
	if ! defined(Class['svnserver']) {
		fail('You must include the svnserver base class before using any svnserver defined resources')
	}

	exec {'add user to subversion group':
		unless => "grep -q 'subversion\\S*${title}' /etc/group",
		command => "usermod -aG subversion ${title}",
		require => Group['subversion']
	}

	package {'apache2-utils':
		ensure => present,
	}

	# TODO: manejar variable para el archivo dav_svn.passwd y que primero cree el file
	exec { 'add user to svn':
	  	command => "htpasswd -c -b /etc/apache2/dav_svn.passwd ${title} ${password}",
	  	creates => '/etc/apache2/dav_svn.passwd',
		require => Package['apache2-utils']
	}
}