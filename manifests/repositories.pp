class svnserver::repositories{
	if $svnserver::default_repository_name{
		svnserver::repository{$svnserver::default_repository_name:}
	}
}