class svnserver::config{
	$repositories_path = $svnserver::repositories_path

	group { 'subversion':
		ensure => present
  	}

	file { $repositories_path:
		ensure 	=> directory,
		owner	=> 'www-data',
		group 	=> 'subversion',
		mode   	=> '2660',
		require => [Group['subversion']]
	}

	#Template needs the variable '$repositories_path'
	file { '/etc/apache2/mods-enabled/dav_svn.conf':
		ensure  => present,
		content => template('svnserver/dav_svn.conf.erb'),
		notify 	=> Class['Apache::Service'],
		require => [Apache::Mod['dav_svn'],Apache::Mod['authn_core']]
	}
}