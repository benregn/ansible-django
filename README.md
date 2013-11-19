ansible-django
==============

Step-by-step
------------

1. have PSQL_USER, PSQL_DB_NAME, PSQL_PASSWORD in your environment

2. configure synced folder in the Vagrantfile, change project_name, deploy and deploy_user

3. change following ansible vars: project_name, root_dir, wsgi_path, logwatch_email, root_address, mailname, deploy_password
    * roles/web/vars
        * rabbitmq.admin_password
        * rabbitmq.password

4. run the provisioning once without uncommenting the `config.ssh.private_key_path = "/path/to/key"` line in the `Vagrantfile


Upgrading guest additions
-------------------------

Sometimes Vagrant boxes have [VirtualBox guest additions](http://www.virtualbox.org/manual/ch04.html) installed that don't match the version installed on the host.
If you'd like to upgrade the guest additions to match the version you have installed the host, you can run the ´upgrade_guest_additions.sh` script.

To upgrade the guest additions:

1. uncomment the `# config.vm.provision "shell", path: "provisioning/upgrade_guest_additions.sh"` line in the `Vagrantfile`
2. change CURRENT_VERSION to the version of VirtualBox you have installed, e.g. 4.3.0
    * run `VBoxManage --version` if don't know the version
3. run `vagrant provision --provision-with shell`
4. comment the line out again to prevent it from running everytime you run `vagrant provision`


TODO:
-----

Write a bit about removing vagrant insecure key task

Include reference to "First 5 min on server" ansible blog post

`supervisor` cannot manage `redmon` at the moment (tasks commented out)

Refactor each major service to be it's own role, e.g. nginx, postgres, redis etc. so they can be included as needed as git submodules.

Use cookiecutter to automate some of the setup for each new project?

Fabric or ansible deploy script

look into monit

Write about adding a rule to ~/.ssh/config to avoid host error

There is a log dir created for the app, /var/log/{{project_name}}


Troubleshooting
---------------

If you run into this error right after `vagrant up`:

```
TASK: [update APT package cache and aptitude safe-upgrade] ********************
fatal: [127.0.0.1] => SSH encountered an unknown error during the connection. We recommend you re-run the command using -vvvv, which will enable SSH debugging output to help diagnose the issue
```

Then just remove the line starting with `[127.0.0.1]:2222` and run `vagrant provision`
