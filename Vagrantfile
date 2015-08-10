# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu14.04-x86"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.network "forwarded_port", guest: 80, host: 8585 #Subversion
  
  config.vm.synced_folder "./", "/etc/puppet/modules/svnserver"

  config.vm.provider :virtualbox do |vb|
	  vb.name = "vagrant-svnserver"
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  # Make sure we have properly udpated apt
  config.vm.provision 'shell',
        :inline => 'if [ ! -f "/apt-cached" ]; then apt-get update && touch /apt-cached; fi'

  config.vm.provision :puppet do |puppet|
	  puppet.manifests_path = "vagrant"
    puppet.manifest_file = "init.pp"
		puppet.module_path = ['spec/fixtures/modules']
  end
end
