
Choisir une adresse IP dans le range 192.168.56.0/21 admis par VirtualBox.

Ou modifier VirtualBox pour changer les ranges (/etc/vbox/networks.conf).

Se logger en SSH dans la VM.

```
vagrant ssh
```

On a bien deux NIC.

```
ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:6b:55:2b brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 85965sec preferred_lft 85965sec
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:0a:f6:75 brd ff:ff:ff:ff:ff:ff
    altname enp0s8
    inet 192.168.56.100/24 brd 192.168.56.255 scope global eth1
       valid_lft forever preferred_lft forever
```

Et deux routes.

```
ip route
default via 10.0.2.2 dev eth0 
10.0.2.0/24 dev eth0 proto kernel scope link src 10.0.2.15 
192.168.56.0/24 dev eth1 proto kernel scope link src 192.168.56.100 
```