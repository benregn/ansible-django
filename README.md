ansible-django
==============

1. run the provisioning once without uncommenting the `config.ssh.private_key_path = "/path/to/key"` line in the `Vagrantfile

TODO:

Write a bit about upgrading guest additions

Write a bit about removing vagrant insecure key task

Include reference to "First 5 min on server" ansible blog post

Refactor each major service to be it's own role, e.g. nginx, postgres, redis etc.

Troubleshooting
---------------

If you run into this error right after `vagrant up`:

```
TASK: [update APT package cache and aptitude safe-upgrade] ********************
fatal: [127.0.0.1] => SSH encountered an unknown error during the connection. We recommend you re-run the command using -vvvv, which will enable SSH debugging output to help diagnose the issue
```

Then just remove the line starting with `[127.0.0.1]:2222` and run `vagrant provision`
