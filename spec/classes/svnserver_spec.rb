require 'spec_helper'

describe 'svnserver' do

	context 'The catalog should at the very least compile' do
	    it { should compile }
	end

	context 'Should add a user to subversion when svn_user => true' do
	    let :params do
		{
			:svn_user => 'user',
			:svn_password => 'pass'
		}
	    end
		it{ should contain_svnserver__user('user').with_password('pass') }
	end

	context 'Should create a default repository when default_repository_name => NAME' do
	    let :params do
		{
			:defaultrepository_name => 'repo',
		}
	    end
		it{ should contain_svnserver__repository('repo')}
	end
end