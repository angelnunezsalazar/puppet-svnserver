# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu14.04-x86"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.network "forwarded_port", guest: 80, host: 8585 #Subversion
  
  config.vm.provider :virtualbox do |vb|
	  vb.name = "vagrant-svnserver"
  end
  
  #config.vm.provision :puppet do |puppet|
	#  puppet.manifests_path = "provisioning/manifests"
  #  puppet.manifest_file = "init.pp"
	#	puppet.module_path = [ 'provisioning/modules', 'provisioning/modules-vendor' ]
  #end
end
