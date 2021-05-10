#!/bin/bash

#iptables
iptables -F ## Removes all rules
iptables -X ## Removes non-default chains
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT -m comment --comment "Any current connection is accepted" 
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT -m comment --comment "Any current connection is accepted"
iptables -A INPUT -p icmp -j ACCEPT -m comment --comment "Allow for ICMP Ping IN"
iptables -A OUTPUT -p icmp -j ACCEPT -m comment --comment "Allow for ICMP Ping out"

## General System Mangement
iptables -A OUTPUT -p udp --dport 53 -d 172.18.64.2,172.18.56.7 -j ACCEPT -m comment --comment "DNS Outbound"
iptables -A OUTPUT -p udp --dport 123 -d 172.18.56.7 -j ACCEPT -m comment --comment "NTP Outbound"
iptables -A INPUT -p tcp --dport 22 -s 172.18.0.0/16 -j ACCEPT -m comment --comment "SSH Inbound"
iptables -A INPUT -p tcp --dport 8006 -s 172.18.0.0/16 -j ACCEPT -m comment --comment "Web GUI"
iptables -A OUTPUT -p tcp --dport 873 -d 172.18.56.14 -m comment --comment "Rsync (Backups)" -j ACCEPT

## Proxmox Specific
iptables -A INPUT -p tcp --dport 25 -j ACCEPT -m comment --comment "Proxmox from Internet"
iptables -A INPUT -p tcp --dport 26 -s 172.18.0.0/16 -j ACCEPT -m comment --comment "Proxmox from Internal Exchange"
iptables -A OUTPUT -p tcp --dport 25 -j ACCEPT -m comment --comment "Proxmox to Internet"
iptables -A OUTPUT -p tcp --dport 80 -d 172.18.0.0/16 -j ACCEPT -m comment --comment "Proxmox for Updates"
iptables -A OUTPUT -p tcp --dport 2703 -j ACCEPT -m comment --comment "Proxmox to internet"

## LDAP Authentication
iptables -A OUTPUT -p tcp --dport 88 -d 172.18.56.7 -m comment --comment "UDP Kerberos Traffic" -j ACCEPT
iptables -A OUTPUT -p udp --dport 88 -d 172.18.56.7 -m comment --comment "TCP Kerberos Traffic" -j ACCEPT
iptables -A OUTPUT -p tcp --dport 389 -d 172.18.56.7 -m comment --comment "TCP Kerberized LDAP Query" -j ACCEPT
iptables -A OUTPUT -p udp --dport 389 -d 172.18.56.7 -m comment --comment "UDP Kerberized LDAP Ping" -j ACCEPT
iptables -A OUTPUT -p tcp --dport 464 -d 172.18.56.7 -m comment --comment "TCP Kerberos - password change" -j ACCEPT
iptables -A OUTPUT -p tcp --dport 3268 -d 172.18.56.7 -m comment --comment "TCP Global Catalog LDAP" -j ACCEPT

## Splunk
iptables -A OUTPUT -p tcp --dport 9997 -d 172.18.56.16 -j ACCEPT -m comment --comment "Splunk Forwarder"

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

#packages
apt purge telent -y

wget http://172.18.56.5/deb/iptables-persistance_1.0.3.deb -O /tmp/iptables-persistance.deb
wget http://172.18.56.5/deb/netfilter-persistance_1.0.3.deb -O /tmp/netfilter-persistance.deb

dpkg -i /tmp/netfilter-persistance.deb
dpkg -i /tmp/iptables-persistance.deb

#Banners and MOTD
echo "UNAUTHORIZED ACCESS TO THIS NETWORK IS PROHIBITED. This device is property of Southeast Missouri State University and is being used by Group 4. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable User of Information Technology Resources Policy (AUP). By using this system, you consent to these terms and conditions. Use is also consent to monitoring, logging, and use of logging to prosecute abuse. If you do not wish to comply with these terms and conditions, you must LOG OFF IMMEDIATELY." >/etc/issue
echo "UNAUTHORIZED ACCESS TO THIS NETWORK IS PROHIBITED. This device is property of Southeast Missouri State University and is being used by Group 4. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable User of Information Technology Resources Policy (AUP). By using this system, you consent to these terms and conditions. Use is also consent to monitoring, logging, and use of logging to prosecute abuse. If you do not wish to comply with these terms and conditions, you must LOG OFF IMMEDIATELY." >/etc/update-motd.d/00-header
