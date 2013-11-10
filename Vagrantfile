# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 4567, host: 4567, id: "redmon"
  config.vm.network :forwarded_port, guest: 8000, host: 8000, id: "django"
  config.vm.network :forwarded_port, guest: 15672, host: 15672, id: "rabbitmq-management"

  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
  config.vm.synced_folder "project_name", "/home/deploy/www/domains/example.com/", id: "django-root", owner: "deploy_user", disabled: false

  # start with provisioning once with the line below commented out.  Then, while the
  # vagrant is halted, uncomment it and bring vagrant back up
  # config.ssh.private_key_path = "/Users/Tomas/.ssh/v

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.inventory_path = "provisioning/local"
  end

  config.vm.provision "shell", path: "provisioning/upgrade_guest_additions.sh"
end
