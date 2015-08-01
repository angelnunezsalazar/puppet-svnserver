class svnserver::users{
	if($svnserver::svn_user and $svnserver::svn_password){
		svnserver::user{$svnserver::svn_user:
			password => $svnserver::svn_password
		}
	}
}