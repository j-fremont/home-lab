
# Installation

## Plugin vagrant-proxyconf

Installer le plugin pour que les guests puissent se connecter au proxy.

```
vagrant plugin install vagrant-proxyconf
```

On peut alors utiliser dans le Vagrantfile.

```
config.proxy.http = "http://adresse.du.proxy:port"
config.proxy.https = "http://adresse.du.proxy:port"
config.proxy.no_proxy = "localhost,127.0.0.1"
```

# Commandes

Les boxes sont sur https://portal.cloud.hashicorp.com/vagrant/discover. Pour récupérer un nouvelle box.

```
vagrant box add generic/rhel8
==> box: Loading metadata for box 'generic/rhel8'
    box: URL: https://vagrantcloud.com/generic/rhel8
This box can work with multiple providers! The providers that it
can work with are listed below. Please review the list and choose
the provider you will be working with.

1) docker
2) hyperv
3) libvirt
4) parallels
5) qemu
6) virtualbox
7) vmware_desktop

Enter your choice: 6
```

Créer le Vagrantfile.

```
vagrant init hashicorp/bionic64
vagrant init kennyl/pfsense --box-version 2.4.0
```

Télécharger la box et lancer la VM.

```
vagrant up
```

Stop the machine, keeping the environment available for later use.

```
vagrant halt
```

Destroy the machine, discarding the entire working environment.

```
vagrant destroy
```
