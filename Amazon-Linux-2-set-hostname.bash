#!/usr/bin/bash
sh -c "echo 'preserve_hostname: true' >> /etc/cloud/cloud.cfg"
hostnamectl set-hostname lam2.lam1.us
sh -c "echo 'HOSTNAME=lam2.lam1.us' >> /etc/sysconfig/network"
