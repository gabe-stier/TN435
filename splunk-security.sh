#!/bin/bash

#Firewall

## Firewall Commands
fw_srv=$(firewall-cmd --add-service)
fw_port=$(firewall-cmd --add-port)

## General Services
$fw_srv ssh
$fw_srv http
$fw_srv https
$fw_srv ntp
$fw_srv ldap
$fw_srv dns

## General Ports
$fw_port 22/tcp
$fw_port 123/udp
$fw_port 53/udp

## Ports for LDAP Authentication
$fw_port 88/tcp
$fw_port 88/udp
$fw_port 389/tcp
$fw_port 389/udp
$fw_port 464/tcp
$fw_port 3268/tcp
$fw_port 873/tcp

## Ports for Splunk
$fw_port 9997/tcp
$fw_port 8000/tcp
$fw_port 8089/tcp
$fw_port 514/tcp
firewall-cmd --add-forward-port=port=443:proto=tcp:toport=8000
firewall-cmd --add-forward-port=port=80:proto=tcp:toport=8000 

## Firewall command for persistance
firewall-cmd --reload
firewall-cmd --set-target DROP
firewall-cmd --runtime-to-permanent

#Banners and MOTD
echo "UNAUTHORIZED ACCESS TO THIS NETWORK IS PROHIBITED. This device is property of Southeast Missouri State University and is being used by Group 4. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable User of Information Technology Resources Policy (AUP). By using this system, you consent to these terms and conditions. Use is also consent to monitoring, logging, and use of logging to prosecute abuse. If you do not wish to comply with these terms and conditions, you must LOG OFF IMMEDIATELY." >/etc/issue
echo "UNAUTHORIZED ACCESS TO THIS NETWORK IS PROHIBITED. This device is property of Southeast Missouri State University and is being used by Group 4. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable User of Information Technology Resources Policy (AUP). By using this system, you consent to these terms and conditions. Use is also consent to monitoring, logging, and use of logging to prosecute abuse. If you do not wish to comply with these terms and conditions, you must LOG OFF IMMEDIATELY." >/etc/update-motd.d/00-header
