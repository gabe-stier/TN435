# Security Scripts
These set of scripts are used on the Linux machines within the systems of TN435 Group 4, 2021. 
___
## Firewall Rules
For more information on how rules are set with these scripts please read [Firewalld](https://firewalld.org/documentation/man-pages/firewall-cmd.html) for Centos machines and [IPtables](https://linux.die.net/man/8/iptables)

### Splunk ([Centos](https://www.centos.org/))
Filename: splunk-security.sh
| Rule Direction | Port | Protocol | Source        | Destination              | Service          | Action | Comment                    |
| -------------- | ---- | -------- | ------------- | ------------------------ | ---------------- | ------ | -------------------------- |
| Inbound        | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                  | ICMP             | Accept | Incoming Ping Requests     |
| Outbound       | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                  | ICMP             | Accept | Outgoing Ping Requests     |
| Inbound        | 22   | TCP      | 172.18.0.0/16 | 0.0.0.0                  | SSH              | Accept | SSH CLI Connection         |
| Inbound        | 8000 | TCP      | 172.18.0.0/16 | 0.0.0.0                  | HTTP             | Accept | Splunk Web                 |
| Inbound        | 514  | UDP      | 172.18.0.0/16 | 0.0.0.0                  | Syslog           | Accept | Syslog                     |
| Inbound        | 9997 | TCP      | 172.18.0.0/16 | 0.0.0.0                  | Splunk Forwarder | Accept | Splunk Forwarder           |
| Outbound       | 80   | TCP      | 0.0.0.0       | 172.18.0.0/16            | HTTP             | Accept | For Updates                |
| Outbound       | 9997 | TCP      | 0.0.0.0       | 0.0.0.0                  | Splunk           | Accept | Splunk Forwarder           |
| Outbound       | 123  | UDP      | 0.0.0.0       | 172.18.56.7              | NTP              | Accept | NTP For clock sync         |
| Outbound       | 53   | UDP      | 0.0.0.0       | 10.40.0.2<br>172.18.56.7 | DNS              | Accept | DNS                        |
| Outbound       | 88   | TCP      | 0.0.0.0       | 172.18.56.7              | Kerberos         | Accept | LDAP                       |
| Outbound       | 88   | UDP      | 0.0.0.0       | 172.18.56.7              | Kerberos         | Accept | LDAP                       |
| Outbound       | 389  | TCP      | 0.0.0.0       | 172.18.56.7              | Kerberos         | Accept | Kerberized LDAP Query      |
| Outbound       | 389  | UDP      | 0.0.0.0       | 172.18.56.7              | Kerberos         | Accept | Kerberized LDAP Ping       |
| Outbound       | 464  | TCP      | 0.0.0.0       | 172.18.56.7              | Kerberos         | Accept | Kerberos - password change |
| Outbound       | 3268 | TCP      | 0.0.0.0       | 172.18.56.7              | Kerberos         | Accept | Global Catalog LDAP        |
| Outbound       | 873  | TCP      | 0.0.0.0       | 172.18.56.14             | Rsync            | Accept | Rsync Backups              |

### SQL ([Centos](https://www.centos.org/))
Filename: sql-security.sh
| Rule Direction | Port | Protocol | Source        | Destination              | Service  | Action | Comment                    |
| -------------- | ---- | -------- | ------------- | ------------------------ | -------- | ------ | -------------------------- |
| Inbound        | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                  | ICMP     | Accept | Incoming Ping Requests     |
| Outbound       | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                  | ICMP     | Accept | Outgoing Ping Requests     |
| Inbound        | 22   | TCP      | 172.18.0.0/16 | 0.0.0.0                  | SSH      | Accept | SSH CLI Connection         |
| Inbound        | 3306 | TCP      | 172.18.0.0/16 | 0.0.0.0                  | MySQL    | Accept | MySQL                      |
| Outbound       | 80   | TCP      | 0.0.0.0       | 172.18.0.0/16            | HTTP     | Accept | For Updates                |
| Outbound       | 9997 | TCP      | 0.0.0.0       | 0.0.0.0                  | Splunk   | Accept | Splunk Forwarder           |
| Outbound       | 123  | UDP      | 0.0.0.0       | 172.18.56.7              | NTP      | Accept | NTP For clock sync         |
| Outbound       | 53   | UDP      | 0.0.0.0       | 10.40.0.2<br>172.18.56.7 | DNS      | Accept | DNS                        |
| Outbound       | 88   | TCP      | 0.0.0.0       | 172.18.56.7              | Kerberos | Accept | LDAP                       |
| Outbound       | 88   | UDP      | 0.0.0.0       | 172.18.56.7              | Kerberos | Accept | LDAP                       |
| Outbound       | 389  | TCP      | 0.0.0.0       | 172.18.56.7              | Kerberos | Accept | Kerberized LDAP Query      |
| Outbound       | 389  | UDP      | 0.0.0.0       | 172.18.56.7              | Kerberos | Accept | Kerberized LDAP Ping       |
| Outbound       | 464  | TCP      | 0.0.0.0       | 172.18.56.7              | Kerberos | Accept | Kerberos - password change |
| Outbound       | 3268 | TCP      | 0.0.0.0       | 172.18.56.7              | Kerberos | Accept | Global Catalog LDAP        |
| Outbound       | 873  | TCP      | 0.0.0.0       | 172.18.56.14             | Rsync    | Accept | Rsync Backups              |

### DNS ([Ubuntu](https://ubuntu.com/))
Filename: dns-security.sh
| Rule Direction | Port | Protocol | Source        | Destination   | Service  | Action | Comment                    |
| -------------- | ---- | -------- | ------------- | ------------- | -------- | ------ | -------------------------- |
| Inbound        | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0       | ICMP     | Accept | Incoming Ping Requests     |
| Outbound       | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0       | ICMP     | Accept | Outgoing Ping Requests     |
| Inbound        | 22   | TCP      | 172.18.0.0/16 | 0.0.0.0       | SSH      | Accept | SSH CLI Connection         |
| Inbound        | 53   | UDP      | 0.0.0.0       | 0.0.0.0       | DNS      | Accept | Incoming DNS               |
| Outbound       | 80   | TCP      | 0.0.0.0       | 172.18.0.0/16 | HTTP     | Accept | For Updates                |
| Outbound       | 9997 | TCP      | 0.0.0.0       | 0.0.0.0       | Splunk   | Accept | Splunk Forwarder           |
| Outbound       | 123  | UDP      | 0.0.0.0       | 172.18.56.7   | NTP      | Accept | NTP For clock sync         |
| Outbound       | 53   | UDP      | 0.0.0.0       | 172.18.56.7   | DNS      | Accept | DNS                        |
| Outbound       | 88   | TCP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | LDAP                       |
| Outbound       | 88   | UDP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | LDAP                       |
| Outbound       | 389  | TCP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | Kerberized LDAP Query      |
| Outbound       | 389  | UDP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | Kerberized LDAP Ping       |
| Outbound       | 464  | TCP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | Kerberos - password change |
| Outbound       | 3268 | TCP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | Global Catalog LDAP        |
| Outbound       | 873  | TCP      | 0.0.0.0       | 172.18.56.14  | Rsync    | Accept | Rsync Backups              |


### SMTP (Proxmox) ([Debian](https://debian.org))
Filename: mail-security.sh
| Rule Direction | Port | Protocol | Source        | Destination              | Service  | Action | Comment                    |
| -------------- | ---- | -------- | ------------- | ------------------------ | -------- | ------ | -------------------------- |
| Inbound        | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                  | ICMP     | Accept | Incoming Ping Requests     |
| Outbound       | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                  | ICMP     | Accept | Outgoing Ping Requests     |
| Inbound        | 25   | TCP      | 0.0.0.0       | 0.0.0.0                  | STMP     | Accept | STMP In from the Internet  |
| Inbound        | 22   | TCP      | 172.18.0.0/16 | 0.0.0.0                  | SSH      | Accept | SSH CLI Connection         |
| Inbound        | 8006 | TCP      | 172.18.0.0/16 | 0.0.0.0                  | HTTPs    | Accept | Web GUI                    |
| Inbound        | 26   | TCP      | 172.18.56.7   | 0.0.0.0                  | STMP     | Accept | STMP from Exchange         |
| Outbound       | 25   | TCP      | 0.0.0.0       | 0.0.0.0                  | STMP     | Accept | STMP Out to the Internet   |
| Outbound       | 80   | TCP      | 0.0.0.0       | 172.18.0.0/16            | HTTP     | Accept | For Updates                |
| Outbound       | 9997 | TCP      | 0.0.0.0       | 0.0.0.0                  | Splunk   | Accept | Splunk Forwarder           |
| Outbound       | 123  | UDP      | 0.0.0.0    # Security Scripts
These set of scripts are used on the Linux machines within the systems of TN435 Group 4, 2021. 
___
## Firewall Rules
For more information on how rules are set with these scripts please read [Firewalld](https://firewalld.org/documentation/man-pages/firewall-cmd.html) for Centos machines and [IPtables](https://linux.die.net/man/8/iptables)

### Splunk ([Centos](https://www.centos.org/))
Filename: splunk-security.sh
| Rule Direction | Port | Protocol | Source        | Destination                | Service          | Action | Comment                    |
| -------------- | ---- | -------- | ------------- | -------------------------- | ---------------- | ------ | -------------------------- |
| Inbound        | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                    | ICMP             | Accept | Incoming Ping Requests     |
| Outbound       | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                    | ICMP             | Accept | Outgoing Ping Requests     |
| Inbound        | 22   | TCP      | 172.18.0.0/16 | 0.0.0.0                    | SSH              | Accept | SSH CLI Connection         |
| Inbound        | 8000 | TCP      | 172.18.0.0/16 | 0.0.0.0                    | HTTP             | Accept | Splunk Web                 |
| Inbound        | 514  | UDP      | 172.18.0.0/16 | 0.0.0.0                    | Syslog           | Accept | Syslog                     |
| Inbound        | 9997 | TCP      | 172.18.0.0/16 | 0.0.0.0                    | Splunk Forwarder | Accept | Splunk Forwarder           |
| Outbound       | 80   | TCP      | 0.0.0.0       | 172.18.0.0/16              | HTTP             | Accept | For Updates                |
| Outbound       | 9997 | TCP      | 0.0.0.0       | 0.0.0.0                    | Splunk           | Accept | Splunk Forwarder           |
| Outbound       | 123  | UDP      | 0.0.0.0       | 172.18.56.7                | NTP              | Accept | NTP For clock sync         |
| Outbound       | 53   | UDP      | 0.0.0.0       | 10.40.0.2<br>172.18.56.7 | DNS              | Accept | DNS                        |
| Outbound       | 88   | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos         | Accept | LDAP                       |
| Outbound       | 88   | UDP      | 0.0.0.0       | 172.18.56.7                | Kerberos         | Accept | LDAP                       |
| Outbound       | 389  | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos         | Accept | Kerberized LDAP Query      |
| Outbound       | 389  | UDP      | 0.0.0.0       | 172.18.56.7                | Kerberos         | Accept | Kerberized LDAP Ping       |
| Outbound       | 464  | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos         | Accept | Kerberos - password change |
| Outbound       | 3268 | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos         | Accept | Global Catalog LDAP        |
| Outbound       | 873  | TCP      | 0.0.0.0       | 172.18.56.14               | Rsync            | Accept | Rsync Backups              |

### SQL ([Centos](https://www.centos.org/))
Filename: sql-security.sh
| Rule Direction | Port | Protocol | Source        | Destination                | Service  | Action | Comment                    |
| -------------- | ---- | -------- | ------------- | -------------------------- | -------- | ------ | -------------------------- |
| Inbound        | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                    | ICMP     | Accept | Incoming Ping Requests     |
| Outbound       | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                    | ICMP     | Accept | Outgoing Ping Requests     |
| Inbound        | 22   | TCP      | 172.18.0.0/16 | 0.0.0.0                    | SSH      | Accept | SSH CLI Connection         |
| Inbound        | 3306 | TCP      | 172.18.0.0/16 | 0.0.0.0                    | MySQL    | Accept | MySQL                      |
| Outbound       | 80   | TCP      | 0.0.0.0       | 172.18.0.0/16              | HTTP     | Accept | For Updates                |
| Outbound       | 9997 | TCP      | 0.0.0.0       | 0.0.0.0                    | Splunk   | Accept | Splunk Forwarder           |
| Outbound       | 123  | UDP      | 0.0.0.0       | 172.18.56.7                | NTP      | Accept | NTP For clock sync         |
| Outbound       | 53   | UDP      | 0.0.0.0       | 10.40.0.2<br>172.18.56.7 | DNS      | Accept | DNS                        |
| Outbound       | 88   | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | LDAP                       |
| Outbound       | 88   | UDP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | LDAP                       |
| Outbound       | 389  | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | Kerberized LDAP Query      |
| Outbound       | 389  | UDP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | Kerberized LDAP Ping       |
| Outbound       | 464  | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | Kerberos - password change |
| Outbound       | 3268 | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | Global Catalog LDAP        |
| Outbound       | 873  | TCP      | 0.0.0.0       | 172.18.56.14               | Rsync    | Accept | Rsync Backups              |

### DNS ([Ubuntu](https://ubuntu.com/))
Filename: dns-security.sh
| Rule Direction | Port | Protocol | Source        | Destination   | Service  | Action | Comment                    |
| -------------- | ---- | -------- | ------------- | ------------- | -------- | ------ | -------------------------- |
| Inbound        | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0       | ICMP     | Accept | Incoming Ping Requests     |
| Outbound       | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0       | ICMP     | Accept | Outgoing Ping Requests     |
| Inbound        | 22   | TCP      | 172.18.0.0/16 | 0.0.0.0       | SSH      | Accept | SSH CLI Connection         |
| Inbound        | 53   | UDP      | 0.0.0.0       | 0.0.0.0       | DNS      | Accept | Incoming DNS               |
| Outbound       | 80   | TCP      | 0.0.0.0       | 172.18.0.0/16 | HTTP     | Accept | For Updates                |
| Outbound       | 9997 | TCP      | 0.0.0.0       | 0.0.0.0       | Splunk   | Accept | Splunk Forwarder           |
| Outbound       | 123  | UDP      | 0.0.0.0       | 172.18.56.7   | NTP      | Accept | NTP For clock sync         |
| Outbound       | 53   | UDP      | 0.0.0.0       | 172.18.56.7   | DNS      | Accept | DNS                        |
| Outbound       | 88   | TCP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | LDAP                       |
| Outbound       | 88   | UDP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | LDAP                       |
| Outbound       | 389  | TCP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | Kerberized LDAP Query      |
| Outbound       | 389  | UDP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | Kerberized LDAP Ping       |
| Outbound       | 464  | TCP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | Kerberos - password change |
| Outbound       | 3268 | TCP      | 0.0.0.0       | 172.18.56.7   | Kerberos | Accept | Global Catalog LDAP        |
| Outbound       | 873  | TCP      | 0.0.0.0       | 172.18.56.14  | Rsync    | Accept | Rsync Backups              |


### SMTP (Proxmox) ([Debian](https://debian.org))
Filename: mail-security.sh
| Rule Direction | Port | Protocol | Source        | Destination                | Service  | Action | Comment                    |
| -------------- | ---- | -------- | ------------- | -------------------------- | -------- | ------ | -------------------------- |
| Inbound        | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                    | ICMP     | Accept | Incoming Ping Requests     |
| Outbound       | N/A  | ICMP     | 0.0.0.0       | 0.0.0.0                    | ICMP     | Accept | Outgoing Ping Requests     |
| Inbound        | 25   | TCP      | 0.0.0.0       | 0.0.0.0                    | STMP     | Accept | STMP In from the Internet  |
| Inbound        | 22   | TCP      | 172.18.0.0/16 | 0.0.0.0                    | SSH      | Accept | SSH CLI Connection         |
| Inbound        | 8006 | TCP      | 172.18.0.0/16 | 0.0.0.0                    | HTTPs    | Accept | Web GUI                    |
| Inbound        | 26   | TCP      | 172.18.56.7   | 0.0.0.0                    | STMP     | Accept | STMP from Exchange         |
| Outbound       | 25   | TCP      | 0.0.0.0       | 0.0.0.0                    | STMP     | Accept | STMP Out to the Internet   |
| Outbound       | 80   | TCP      | 0.0.0.0       | 172.18.0.0/16              | HTTP     | Accept | For Updates                |
| Outbound       | 9997 | TCP      | 0.0.0.0       | 0.0.0.0                    | Splunk   | Accept | Splunk Forwarder           |
| Outbound       | 123  | UDP      | 0.0.0.0       | 172.18.56.7                | NTP      | Accept | NTP For clock sync         |
| Outbound       | 53   | UDP      | 0.0.0.0       | 10.40.0.2<br>172.18.56.7 | DNS      | Accept | DNS                        |
| Outbound       | 88   | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | LDAP                       |
| Outbound       | 88   | UDP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | LDAP                       |
| Outbound       | 389  | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | Kerberized LDAP Query      |
| Outbound       | 389  | UDP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | Kerberized LDAP Ping       |
| Outbound       | 464  | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | Kerberos - password change |
| Outbound       | 3268 | TCP      | 0.0.0.0       | 172.18.56.7                | Kerberos | Accept | Global Catalog LDAP        |
| Outbound       | 873  | TCP      | 0.0.0.0       | 172.18.56.14               | Rsync    | Accept | Rsync Backups              |

___
## Banner
    UNAUTHORIZED ACCESS TO THIS NETWORK IS PROHIBITED. This device is property of Southeast Missouri State University and is being used by Group 4. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable User of Information Technology Resources Policy (AUP). By using this system, you consent to these terms and conditions. Use is also consent to monitoring, logging, and use of logging to prosecute abuse. If you do not wish to comply with these terms and conditions, you must LOG OFF IMMEDIATELY.