
```
Vagrant gathered an unknown Ansible version:

and falls back on the compatibility mode '1.8'.

Alternatively, the compatibility mode can be specified in your Vagrantfile:
https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode
...
ansible-playbook: error: unrecognized arguments: --sudo
```

Il faut ajouter l'option.

```
ansible.compatibility_mode = "2.0"
```

