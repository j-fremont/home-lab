
```
1) enp0s31f6
2) wlp0s20f3
==> web: When choosing an interface, it is usually the one that is
==> web: being used to connect to the internet.
==> web: 
    web: Which interface should the network bridge to? 2
```

Pour fixer le NIC (sans que Vagrant le demande lors du vagrant up).

```
test.vm.network :public_network, :bridge => 'wlp0s20f3'
```

Une adresse IP sur le même réseau que le host (192.168.1.0/24) est attribué au guest.

Côté host.

```
ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
...
3: wlp0s20f3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether bc:f1:71:9d:03:4b brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.23/24 brd 192.168.1.255 scope global dynamic noprefixroute wlp0s20f3
       valid_lft 51114sec preferred_lft 51114sec
    inet6 fe80::442f:c9f4:8700:fa3c/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever

```

Côté guest.

```
ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:b8:a1:fb brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 86328sec preferred_lft 86328sec
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:70:45:76 brd ff:ff:ff:ff:ff:ff
    altname enp0s8
    inet 192.168.1.28/24 brd 192.168.1.255 scope global dynamic eth1
       valid_lft 86340sec preferred_lft 86340sec
```



