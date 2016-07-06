# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "stojg/debian"
  config.vm.box_check_update = true
	config.vm.synced_folder "./ansible/", "/vagrant"
	config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "256"
	end
  config.vm.provision "ansible_local" do |ansible|
  		ansible.install = false
      ansible.playbook = "local.yml"
    end
end
