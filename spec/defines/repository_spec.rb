require 'spec_helper'

describe 'svnserver::repository ' do
	let :pre_condition do
		'class { "svnserver": }'
	end
	let :title do
		'repository'
	end

	it {should contain_exec('create repository repository').with(
		'command' => 'svnadmin create /srv/svn/repository',
		'creates' => '/srv/svn/repository')
	}
	it {should contain_file('repository permissions repository')
					.with_path('/srv/svn/repository')}

end