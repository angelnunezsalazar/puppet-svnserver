define svnserver::repository{

	# The base class must be included first because it is used to extract some variables
	if ! defined(Class['svnserver']) {
		fail('You must include the svnserver base class before using any apache defined resources')
	}
	
	$repositories_path= $svnserver::repositories_path

	exec {'create repository':
	  	command => "svnadmin create ${repositories_path}/${title}",
	  	creates => "${repositories_path}/${title}",
		require => [Package['subversion'], File[$repositories_path]]
	}
	
	file {'repository permissions':
		ensure 	=> directory,
		path    => "${repositories_path}/${title}",
		owner	=> 'www-data',
		group 	=> 'subversion',
		mode   	=> '2660',
		recurse => true,
		require => Exec['create repository'],
		notify 	=> Class['Apache::Service']
	}
}