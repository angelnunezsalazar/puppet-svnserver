
#TODO: solo maneja el primer usuario, falta lógica para que no vuelva a crear el archivo si ya existe
define svnserver::user(
	$password
){
	# The base class must be included first because it is used to extract some variables
	if ! defined(Class['svnserver']) {
		fail('You must include the svnserver base class before using any apache defined resources')
	}

	exec {'add user to subversion group':
		unless => "grep -q 'subversion\\S*${title}' /etc/group",
		command => "usermod -aG subversion ${title}",
		require => Group['subversion']
	}

	exec { 'add user to svn':
	  	command => "htpasswd -c -b /etc/apache2/dav_svn.passwd ${title} ${password}",
	  	creates => '/etc/apache2/dav_svn.passwd',
		require => Package['apache2-utils']
	}
}