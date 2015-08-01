require 'spec_helper'

describe 'svnserver::user ' do
	let :pre_condition do
		'class { "svnserver": }'
	end
	let :title do
		'user'
	end
	let :params do
		{
			:password => 'password'
		}
	end

	it {should contain_exec('add user to subversion group')
		.with_command('usermod -aG subversion user')}

	it {should contain_exec('add user to svn')
		.with_command('htpasswd -c -b /etc/apache2/dav_svn.passwd user password')}

end