#!/usr/bin/bash
sh -c "echo 'preserve_hostname: true' >> /etc/cloud/cloud.cfg"
hostnamectl set-hostname lam2.duckdns.org
sh -c "echo 'HOSTNAME=lam2.duckdns.org' >> /etc/sysconfig/network"
