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

	apache::mod { 'authn_core':}
	apache::mod { 'authn_file': }
	apache::mod { 'authz_user':}
	apache::mod { 'dav':}
	apache::mod { 'dav_svn':}
	apache::mod { 'auth_basic':}

	# The apache module will automatically create a symlink in the mod_enable_dir
	# the ordening is also set by the apache module (apache::mod)
	# Template needs the variable '$repositories_path'
	file {'dav_svn.conf':
		ensure  => file,
		path    => "${::apache::mod_dir}/dav_svn.conf",
		content => template('svnserver/dav_svn.conf.erb'),
	}
}

