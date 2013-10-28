# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 4567, host: 4567, id: "redmon"

  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true

  # start with provisioning once with the line below commented out, then uncomment it
  # config.ssh.private_key_path = "/Users/Tomas/.ssh/v"

  # config.vm.provision "shell", path: "provisioning/upgrade_guest_additions.sh"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.inventory_path = "provisioning/local"
  end
end
