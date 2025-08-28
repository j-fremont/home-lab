
Lorsque l'on a cette erreur sur le vagrant up, Vagrant n'arrive pas à monter le dossier courant sur /vagrant dans la VM.

```
Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:

mount -t vboxvfs -o uid=1001,gid=1001 vagrant /vagrant

The error output from the command was:

Operation not supported by device
```

```
vagrant plugin install vagrant-vbguest
```

Ne résoud pas le problème, et en plus ne passe plus le proxy. Donc faire.

```
vagrant plugin uninstall vagrant-vbguest
```

Lancer les VM web avant la VM PfSense.

Ensuite, pas d'accès à la web UI de PfSense si la WM est en NAT network avec une redirection de port (ex: 8888 => 80). On a une erreur SSL_ERROR_RX_RECORD_TOO_LONG sur http://localhost:8888.

Il faut.
+ Créer une interface bridge (public_network en Vagrant).
+ Créer un NatNetwork 10.0.2.0/24 dans VirtualBox.
+ Lancer Vagrant.
+ Noter les adresses MAC des NIC NAT et bridge (respectivement LAN et WAN pour PfSense).
+ Ouvrir la VM PFSense.
  + Assign Interfaces (LAN => NAT, WAN => bridge).
  + Set interface(s) IP address (il faut les redéfinir malgré celles qui sont dans le Vagrantfile).





