
# Installation


# Utilisation

## Création du user Ansible

Sur la machine cible (192.168.1.10).

```
sudo useradd -m rpi_ansible
sudo passwd rpi_ansible
sudo mkdir rpi_ansible/.ssh
sudo chown rpi_ansible:rpi_ansible .ssh
```

Sur la machine Ansible.

```
ssh-keygen -f ~/.ssh/ansible
ssh-copy-id -i .ssh/ansible.pub rpi_ansible@192.168.1.10
```

La clé publique de la machine Ansible est enregistré dans le .ssh/authorized_keys de la machine cible. On peut lancer un agent SSH sur la machine Ansible en y ajoutant la clé privée.

```
eval $(ssh-agent)
ssh-add .ssh/ansible
```

Et lancer des playbooks Ansible via cet agent.

```
ansible-playbook -i inventory.yml playbook.yml
```

## Installation d'un collection

Pour installer la collection Docker Community.

```
ansible-galaxy collection install community.docker --force
ansible-galaxy collection list community.docker

# /home/fremont/.ansible/collections/ansible_collections
Collection       Version
---------------- -------
community.docker 4.7.0  
```




