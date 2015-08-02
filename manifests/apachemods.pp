class svnserver::apachemods{

	class{'apache':
		default_mods => false
	}

	apache::mod { 'authn_core':}
	apache::mod { 'authn_file': }
	apache::mod { 'authz_user':}
	apache::mod { 'dav':}
	apache::mod { 'dav_svn':}
	apache::mod { 'auth_basic':}
}