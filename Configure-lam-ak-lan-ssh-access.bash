#!/usr/bin/bash
# Configure-lam-ak-lan-ssh-access.bash
# Uses ${Public_IPv4} exported in parent process

echo ${Public_IPv4}
if [[ ${Public_IPv4} != 'none' ]] ; then
 echo 'AWS LAM configure lam-ak-lan for Public IPv4 access'
 cp /var/www/aws/etc/ssh/ssh_config.d/lam-ak-lan.conf /etc/ssh/ssh_config.d
else
 echo 'AWS LAM configure aws-gateway for No-Public-IPv4 instance'
 cp /var/www/aws/etc/ssh/ssh_config.d/aws-gateway.conf /etc/ssh/ssh_config.d
fi
cp /var/www/aws/etc/profile.d/ssh_tunnel.sh /etc/profile.d
