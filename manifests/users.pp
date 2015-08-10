class svnserver::users{
	$user = $::svnserver::defaultuser_username
	$password = $::svnserver::defaultuser_password
	if($user and $password){
		svnserver::user{$user:
			password => $password
		}
	}
}