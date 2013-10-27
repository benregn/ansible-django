ansible-django
==============

1. run the provisioning once without uncommenting the `config.ssh.private_key_path = "/path/to/key"` line in the `Vagrantfile

TODO:

Write a bit about upgrading guest additions

Write a bit about removing vagrant insecure key task

Include reference to "First 5 min on server" ansible blog post

Refactor each major service to be it's own role, e.g. nginx, postgres, redis etc.
