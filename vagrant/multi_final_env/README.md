
Quatre VM avec chacune :
+ une IP bridge,
+ une IP sur un NAT network.

| VM | IP bridge | IP NAT |
|-|-|-|
| web | 192.168.1.50 | 10.0.2.10 |
| nexus | 192.168.1.51 | 10.0.2.11 |
| db | | 10.0.2.12 |
| ntp | | 10.0.2.13 |

Forward de ports.
+ http://localhost:8080 sur web:80
+ http://localhost:8081 sur nexus:80
