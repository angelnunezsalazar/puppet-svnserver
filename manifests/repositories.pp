class svnserver::repositories{
	if $::svnserver::defaultrepository_name{
		svnserver::repository{$::svnserver::defaultrepository_name:}
	}
}