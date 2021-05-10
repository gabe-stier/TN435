#!/bin/bash

#iptables
## General Firewall Settings
iptables -F ## Removes all rules
iptables -X ## Removes non-default chains
iptables -A INPUT -m state --state RELATED,ESTABLISHED -m comment --comment "Any current connection is accepted" -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -m comment --comment "Any current connection is accepted" -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT -m comment --comment "Allow for ICMP Ping IN"
iptables -A OUTPUT -p icmp -j ACCEPT -m comment --comment "Allow for ICMP Ping out"

## General System Mangement
iptables -A INPUT -p tcp --dport 22 -s 172.18.0.0/16 -m comment --comment "SSH Inbound" -j ACCEPT
iptables -A INPUT -p udp --dport 53 -m comment --comment "DNS Inbound" -j ACCEPT
iptables -A OUTPUT -p udp --dport 123 -d 172.18.56.7 -m comment --comment "NTP Outbound" -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -m comment --comment "DNS Outbound" -j ACCEPT
iptables -A OUTPUT -p tcp --dport 873 -d 172.18.56.14 -m comment --comment "Rsync (Backups)" -j ACCEPT

## LDAP Authentication
iptables -A OUTPUT -p tcp --dport 88 -d 172.18.56.7 -m comment --comment "UDP Kerberos Traffic" -j ACCEPT
iptables -A OUTPUT -p udp --dport 88 -d 172.18.56.7 -m comment --comment "TCP Kerberos Traffic" -j ACCEPT
iptables -A OUTPUT -p tcp --dport 389 -d 172.18.56.7 -m comment --comment "TCP Kerberized LDAP Query" -j ACCEPT
iptables -A OUTPUT -p udp --dport 389 -d 172.18.56.7 -m comment --comment "UDP Kerberized LDAP Ping" -j ACCEPT
iptables -A OUTPUT -p tcp --dport 464 -d 172.18.56.7 -m comment --comment "TCP Kerberos - password change" -j ACCEPT
iptables -A OUTPUT -p tcp --dport 3268 -d 172.18.56.7 -m comment --comment "TCP Global Catalog LDAP" -j ACCEPT

## Update
iptables -A OUTPUT -p tcp --dport 443 -d 172.18.56.0/26 -m comment --comment "HTTPs to internal server network" -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -d 172.18.56.0/26 -m comment --comment "HTTP  to internal server network" -j ACCEPT

## Splunk
iptables -A OUTPUT -p tcp --dport 9997 -d 172.18.56.16 -m comment --comment "Splunk Forwarder" -j ACCEPT

## Implicit Deny
iptables -P INPUT DROP   ## Implicit Inbound Deny
iptables -P OUTPUT DROP  ## Implicit Outbound Deny
iptables -P FORWARD DROP ## Implicit Forward Deny

## IPv6 Firewall
ip6tables -F              ## Removes all rules
ip6tables -X              ## Removes non-default chains
ip6tables -P INPUT DROP   ## Implicit Inbound Deny
ip6tables -P OUTPUT DROP  ## Implicit Outbound Deny
ip6tables -P FORWARD DROP ## Implicit Forward Deny

# Packages For Iptables Persistance
wget http://172.18.56.5/deb/iptables-persistance_1.0.3.deb -O /tmp/iptables-persistance.deb
wget http://172.18.56.5/deb/netfilter-persistance_1.0.3.deb -O /tmp/netfilter-persistance.deb

dpkg -i /tmp/netfilter-persistance.deb
dpkg -i /tmp/iptables-persistance.deb

#Banners and MOTD
echo "UNAUTHORIZED ACCESS TO THIS NETWORK IS PROHIBITED. This device is property of Southeast Missouri State University and is being used by Group 4. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable User of Information Technology Resources Policy (AUP). By using this system, you consent to these terms and conditions. Use is also consent to monitoring, logging, and use of logging to prosecute abuse. If you do not wish to comply with these terms and conditions, you must LOG OFF IMMEDIATELY." >/etc/issue
printf '#!/bin/sh\necho "---------------"\necho "UNAUTHORIZED ACCESS TO THIS NETWORK IS PROHIBITED. This device is property of Southeast Missouri State University and is being used by Group 4. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable User of Information Technology Resources Policy (AUP). By using this system, you consent to these terms and conditions. Use is also consent to monitoring, logging, and use of logging to prosecute abuse. If you do not wish to comply with these terms and conditions, you must LOG OFF IMMEDIATELY."\necho "--------------------"' >/etc/update-motd.d/00-header
