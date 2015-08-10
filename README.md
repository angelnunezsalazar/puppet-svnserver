# puppet-svnserver

## How to use it

```
class{'svnserver':
	defaultuser_username 	=>'vagrant',
	defaultuser_password 	=> 'vagrant',
	defaultrepository_name 	=> 'default-repo',
}
```